import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:expense_tracker/expense.dart';
import 'package:expense_tracker/expense_repo.dart';

part 'get_expenses_event.dart';
part 'get_expenses_state.dart';

class GetExpensesBloc extends Bloc<GetExpensesEvent, GetExpensesState> {
  ExpenseRepository expenseRepository;

  GetExpensesBloc(this.expenseRepository) : super(GetExpensesInitial()) {
    on<GetExpenses>((event, emit) async {
      emit(GetExpensesLoading());
      try {
        List<Expense> expenses = await expenseRepository.getExpenses();
        emit(GetExpensesSuccess(expenses));
      } catch (e) {
        emit(GetExpensesFailure());
      }
    });
  }
}