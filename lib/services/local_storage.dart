import 'package:hive_flutter/hive_flutter.dart';

class LocalStorageService {
  static const String _expensesBox = 'expenses';
  static const String _budgetsBox = 'budgets';
  static const String _userBox = 'user';

  // Initialize boxes
  static Future<void> initializeBoxes() async {
    await Hive.openBox(_expensesBox);
    await Hive.openBox(_budgetsBox);
    await Hive.openBox(_userBox);
  }

  // Expenses
  static Future<void> saveExpense(String id, Map<String, dynamic> expense) async {
    final box = Hive.box(_expensesBox);
    await box.put(id, expense);
  }

  static Future<List<dynamic>> getAllExpenses() async {
    final box = Hive.box(_expensesBox);
    return box.values.toList();
  }

  static Future<void> deleteExpense(String id) async {
    final box = Hive.box(_expensesBox);
    await box.delete(id);
  }

  // Budgets
  static Future<void> saveBudget(String id, Map<String, dynamic> budget) async {
    final box = Hive.box(_budgetsBox);
    await box.put(id, budget);
  }

  static Future<List<dynamic>> getAllBudgets() async {
    final box = Hive.box(_budgetsBox);
    return box.values.toList();
  }

  static Future<void> deleteBudget(String id) async {
    final box = Hive.box(_budgetsBox);
    await box.delete(id);
  }

  // User
  static Future<void> saveUser(Map<String, dynamic> user) async {
    final box = Hive.box(_userBox);
    await box.put('currentUser', user);
  }

  static Future<Map<String, dynamic>?> getUser() async {
    final box = Hive.box(_userBox);
    return box.get('currentUser');
  }

  static Future<void> deleteUser() async {
    final box = Hive.box(_userBox);
    await box.delete('currentUser');
  }

  // Clear all data
  static Future<void> clearAllData() async {
    final expensesBox = Hive.box(_expensesBox);
    final budgetsBox = Hive.box(_budgetsBox);
    final userBox = Hive.box(_userBox);

    await expensesBox.clear();
    await budgetsBox.clear();
    await userBox.clear();
  }
}
