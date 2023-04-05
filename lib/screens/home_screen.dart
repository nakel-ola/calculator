import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/widgets.dart';

const nums = [
  "÷",
  "×",
  "-",
  "+",
  "%",
  "0",
  "1",
  "2",
  "3",
  "4",
  "5",
  "6",
  "7",
  "8",
  "9",
  "."
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String userInput = "";
  String answer = "";

  _updateUserInput(String value) {
    setState(() {
      userInput = value;
    });
  }

  _updateStore(String answer) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final String stringData = prefs.getString("history") ?? "[]";

    final List<dynamic> items = jsonDecode(stringData);

    items.add({"input": userInput, "answer": answer});

    prefs.setString("history", jsonEncode(items));
  }

  _equalPressed() async {
    String finalUserInput = userInput.replaceAll('×', '*').replaceAll("÷", "/");

    Parser p = Parser();
    Expression exp = p.parse(finalUserInput);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    String newAnswer = eval.toString();

    await _updateStore(newAnswer);

    setState(() {
      answer = newAnswer;
    });
  }

  _onPressed(String value) {
    if (nums.contains(value)) _updateUserInput(userInput += value);

    if (value == "clear") {
      setState(() {
        userInput = "";
        answer = "";
      });
    }

    if (value == "backspace" && userInput.isNotEmpty) {
      String newInput = userInput.substring(0, userInput.length - 1);
      _updateUserInput(newInput);
    }

    if (value == "=") _equalPressed();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.onPrimary,
      appBar: AppBar(
        backgroundColor: theme.colorScheme.surface,
        actions: [
          IconButton(
            onPressed: () => Navigator.of(context).pushNamed("/history"),
            icon: const Icon(Icons.history, size: 30),
          )
        ],
      ),
      body: Column(
        children: [
          Screen(
            title: userInput,
            label: answer,
          ),
          Keypad(
            onPressed: _onPressed,
          ),
        ],
      ),
    );
  }
}
