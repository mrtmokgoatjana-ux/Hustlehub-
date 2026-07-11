class Budget {
  final String id;
  final String category;
  final double limit;
  final double spent;
  final DateTime createdAt;

  Budget({
    required this.id,
    required this.category,
    required this.limit,
    required this.spent,
    required this.createdAt,
  });

  double get remaining => limit - spent;
  double get percentage => spent / limit;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'category': category,
      'limit': limit,
      'spent': spent,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  factory Budget.fromJson(Map<String, dynamic> json) {
    return Budget(
      id: json['id'],
      category: json['category'],
      limit: json['limit'],
      spent: json['spent'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }
}
