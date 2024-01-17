class DuckFact {
  int feistynessRating;
  bool quack;
  String fact;

  DuckFact(
      {required this.feistynessRating,
      required this.quack,
      required this.fact});

  factory DuckFact.fromJson(Map<String, dynamic> jsonMap) {
    return DuckFact(
      fact: jsonMap["fact"],
      quack: jsonMap["quack"],
      feistynessRating: jsonMap["feistynessRating"],
    );
  }
}
