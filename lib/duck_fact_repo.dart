import 'dart:convert';

import 'package:duck_facts/duck_fact.dart';
import 'package:http/http.dart';

class DuckFactRepository {
  final factUri =
      "https://03vpefsitf.execute-api.eu-west-1.amazonaws.com/prod/";

// Holt das Textgraffe aus dem Inet und gibt es zurück

  Future<String> _getDataFromApi() async {
    final Response response = await get(Uri.parse(factUri));
    final String jsonString = response.body;
    return jsonString;
  }

// Dekodiert den JSON String und gibt den Fact zurück
  Future<DuckFact> getDuckFact() async {
    final String jsonString = await _getDataFromApi();
    final Map<String, dynamic> jsonMap = jsonDecode(jsonString);
    print(jsonMap);

    final DuckFact newDuckFact = DuckFact.fromJson(jsonMap);
    return newDuckFact;
  }
}
