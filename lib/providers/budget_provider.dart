import 'package:flutter/material.dart';

class BudgetProvider extends ChangeNotifier {
  List<Map<String, dynamic>> _budgets = [];

  List<Map<String, dynamic>> get budgets => _budgets;

  void addBudget({
    required String id,
    required String category,
    required double limit,
    required double spent,
  }) {
    _budgets.add({
      'id': id,
      'category': category,
      'limit': limit,
      'spent': spent,
      'createdAt': DateTime.now(),
    });
    
    notifyListeners();
  }

  void updateBudgetSpent(String id, double amount) {
    final index = _budgets.indexWhere((b) => b['id'] == id);
    if (index != -1) {
      _budgets[index]['spent'] += amount;
      notifyListeners();
    }
  }

  void deleteBudget(String id) {
    _budgets.removeWhere((b) => b['id'] == id);
    notifyListeners();
  }

  Map<String, dynamic>? getBudgetById(String id) {
    try {
      return _budgets.firstWhere((b) => b['id'] == id);
    } catch (e) {
      return null;
    }
  }

  Map<String, dynamic>? getBudgetByCategory(String category) {
    try {
      return _budgets.firstWhere((b) => b['category'] == category);
    } catch (e) {
      return null;
    }
  }

  double getTotalBudgetLimit() {
    return _budgets.fold(0.0, (sum, b) => sum + b['limit']);
  }

  double getTotalBudgetSpent() {
    return _budgets.fold(0.0, (sum, b) => sum + b['spent']);
  }

  int getOverBudgetCount() {
    return _budgets.where((b) => b['spent'] > b['limit']).length;
  }

  void clearBudgets() {
    _budgets.clear();
    notifyListeners();
  }
}
