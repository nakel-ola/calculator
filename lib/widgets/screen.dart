import 'package:flutter/material.dart';

class Screen extends StatelessWidget {
  final String title;
  final String label;
  const Screen({
    super.key,
    required this.title,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Container(
      color: theme.colorScheme.surface,
      height: MediaQuery.of(context).size.height * 0.3,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(title, style: const TextStyle(fontSize: 48.0)),
            if (label.isNotEmpty)
              Text(
                label,
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
