import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_tracker/category_entity.dart';
import 'package:flutter/foundation.dart';
import 'package:expense_tracker/category.dart';  // Category class

class ExpenseEntity {
  String expenseId;
  Category category;
  DateTime date;
  int amount;

  ExpenseEntity({
    required this.expenseId,
    required this.category,
    required this.date,
    required this.amount,
  });

  // Convert ExpenseEntity to Firestore document
  Map<String, Object?> toDocument() {
    return {
      'expenseId': expenseId,
      'category': category.toEntity().toDocument(),  // Category to CategoryEntity to document
      'date': date,
      'amount': amount,
    };
  }

  // Create ExpenseEntity from Firestore document
  static ExpenseEntity fromDocument(Map<String, dynamic> doc) {
    return ExpenseEntity(
      expenseId: doc['expenseId'],
      category: Category.fromEntity(CategoryEntity.fromDocument(doc['category'])),  // Document to CategoryEntity to Category
      date: (doc['date'] as Timestamp).toDate(),
      amount: doc['amount'],
    );
  }
}