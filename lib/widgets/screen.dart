import 'package:flutter/material.dart';

class Screen extends StatelessWidget {
  final String value;
  final String result;
  const Screen({
    super.key,
    required this.value,
    required this.result,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Container(
      color: theme.colorScheme.surface,
      height: MediaQuery.of(context).size.height * 0.3,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(value, style: const TextStyle(fontSize: 48.0)),
            Text(
              result,
              style: TextStyle(
                fontSize: 32.0,
                color: theme.hintColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
