import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    String value = "40×2";
    String result = "80";
    return Scaffold(
      backgroundColor: theme.colorScheme.onPrimary,
      appBar: AppBar(
        backgroundColor: theme.colorScheme.surface,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.history, size: 30),
          )
        ],
      ),
      body: Column(
        children: [
          Screen(
            value: value,
            result: result,
          ),
          Keypad(
            onPressed: (_) {},
          ),
        ],
      ),
    );
  }
}
