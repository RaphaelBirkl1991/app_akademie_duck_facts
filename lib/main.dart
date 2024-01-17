import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

void main() {
  runApp(const MainApp());
}

const factUri = "https://03vpefsitf.execute-api.eu-west-1.amazonaws.com/prod/";

// Datenklasse (speichert Daten)
class DuckFact {
  int feistynessRating;
  bool quack;
  String fact;

  DuckFact(
      {required this.feistynessRating,
      required this.quack,
      required this.fact});
}

// Holt das Textgraffe aus dem Inet und gibt es zurück

Future<String> getDataFromApi() async {
  final Response response = await get(Uri.parse(factUri));
  final String jsonString = response.body;
  return jsonString;
}

// Dekodiert den JSON String und gibt den Fact zurück
Future<String> getDuckFact() async {
  final String jsonString = await getDataFromApi();
  final Map<String, dynamic> jsonMap = jsonDecode(jsonString);
  print(jsonMap);
  final String duckFact = jsonMap["fact"];

  final int feistynessRating = jsonMap["feistynessRating"];
  final bool quack = jsonMap["quack"];
  final String fact = jsonMap["fact"];

  final DuckFact newDuckFact =
      DuckFact(feistynessRating: -1, quack: false, fact: duckFact);
  return duckFact;
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  String duckFact = "";

  @override
  Widget build(BuildContext context) {
    getDuckFact();
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(duckFact.isEmpty
                    ? 'Noch keinen DuckFact geholt'
                    : duckFact),
                const SizedBox(height: 16),
                OutlinedButton(
                  onPressed: () async {
                    duckFact = await getDuckFact();
                    setState(() {});
                  },
                  child: const Text("Get new Fact"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
