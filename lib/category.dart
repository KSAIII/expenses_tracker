import 'package:expense_tracker/category_entity.dart';

class Category {
  final String categoryId;
  final String name;
  final double totalExpenses;
  final String icon;
  final int color;

  // Constructor for Category class
  Category({
    required this.categoryId,
    required this.name,
    required this.totalExpenses,
    required this.icon,
    required this.color,
  });

  // Static getter for an empty Category
  static Category get empty {
    return Category(
      categoryId: '',
      name: '',
      totalExpenses: 0.0,
      icon: '',
      color: 0, // Default color (you might want to change this)
    );
  }

  // Converts a CategoryEntity to a Category instance
  factory Category.fromEntity(CategoryEntity entity) {
    return Category(
      categoryId: entity.categoryId,
      name: entity.name,
      totalExpenses: entity.totalExpenses.toDouble(),
      icon: entity.icon,
      color: entity.color,
    );
  }

  // Converts a Category instance to a CategoryEntity
  CategoryEntity toEntity() {
    return CategoryEntity(
      categoryId: categoryId,
      name: name,
      totalExpenses: totalExpenses.toInt(),
      icon: icon,
      color: color,
    );
  }
}
