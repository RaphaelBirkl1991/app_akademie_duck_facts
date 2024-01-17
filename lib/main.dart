import 'package:duck_facts/duck_fact.dart';
import 'package:duck_facts/duck_fact_repo.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  DuckFactRepository repository = DuckFactRepository();
  DuckFact? duckFact;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(duckFact == null
                    ? 'Noch keinen DuckFact geholt'
                    : duckFact?.fact ?? ""),
                const SizedBox(height: 16),
                OutlinedButton(
                  onPressed: () async {
                    duckFact = await repository.getDuckFact();
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
