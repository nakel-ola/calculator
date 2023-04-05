import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  List<dynamic> _items = [];

  @override
  void initState() {
    super.initState();
    getHistory();
  }

  _clearHistory() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.remove("history");

    setState(() {
      _items = [];
    });
  }

  _onClearPressed() {
    showDialog(
      context: context,
      builder: (BuildContext ctx) {
        return AlertDialog(
          title: const Text(
            "Clear ",
            style: TextStyle(fontSize: 24.0),
          ),
          content: const Text(
            "Clear history and memory ?",
            style: TextStyle(fontSize: 16.0),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("Dismiss", style: TextStyle(fontSize: 16.0)),
            ),
            TextButton(
              onPressed: () {
                _clearHistory();
                Navigator.of(context).pop();
              },
              child: const Text("Clear", style: TextStyle(fontSize: 16.0)),
            ),
          ],
          contentPadding: const EdgeInsets.only(left: 16.0, bottom: 16.0),
          actionsPadding: const EdgeInsets.only(bottom: 8.0, right: 16.0),
          titlePadding:
              const EdgeInsets.only(top: 16.0, left: 16.0, bottom: 8.0),
        );
      },
    );
  }

  getHistory() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    String? stringData = prefs.getString("history") ?? "[]";

    final List<dynamic> items = jsonDecode(stringData);

    setState(() {
      _items = items;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("History"),
        actions: [
          if (_items.isNotEmpty)
            IconButton(
              onPressed: _onClearPressed,
              icon: const Icon(Icons.clear_all, size: 30),
            )
        ],
      ),
      body: _items.isNotEmpty
          ? SingleChildScrollView(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: _items
                      .map(
                        (e) => Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(e["input"],
                                style: const TextStyle(fontSize: 48.0)),
                            Text(
                              e["answer"],
                              style: TextStyle(
                                fontSize: 32.0,
                                color: Theme.of(context).hintColor,
                              ),
                            ),
                          ],
                        ),
                      )
                      .toList(),
                ),
              ),
            )
          : Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.history, size: 50.0),
                  Text("No History", style: TextStyle(fontSize: 16.0)),
                ],
              ),
            ),
    );
  }
}
