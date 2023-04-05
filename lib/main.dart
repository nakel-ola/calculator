import 'package:calculator/screens/history_screen.dart';
import 'package:flutter/material.dart';

import 'color_schemes.dart';
import 'screens/screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: lightColorScheme,
        fontFamily: "Lato",
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: darkColorScheme,
        fontFamily: "Lato",
      ),
      routes: {
        "/": (ctx) => const HomeScreen(),
        "/history": (ctx) => const HistoryScreen(),
      },
    );
  }
}
