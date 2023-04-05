import 'package:flutter/material.dart';

class Keypad extends StatelessWidget {

  final Function(String) onPressed;

  const Keypad({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    const double fontSize = 32.0;

    final TextStyle greenStyle = TextStyle(
      fontSize: fontSize,
      color: theme.primaryColor,
    );

    const TextStyle textStyle = TextStyle(
      fontSize: fontSize,
    );

    return Expanded(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.7,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            RowKeys(
              children: [
                Button(
                  label: "clear",
                  onPressed: onPressed,
                  child: Icon(
                    Icons.restart_alt,
                    color: theme.primaryColor,
                    size: 30.0,
                  ),
                ),
                Button(
                  onPressed: onPressed,
                  label: "/",
                  child: Text("÷", style: greenStyle),
                ),
                Button(
                  onPressed: onPressed,
                  label: "×",
                  child: Text("×", style: greenStyle),
                ),
                Button(
                  onPressed: onPressed,
                  label: "backspace",
                  child: Icon(Icons.backspace, color: theme.primaryColor),
                ),
              ],
            ),
    
            // row 2
    
            RowKeys(
              children: [
                Button(
                  onPressed: onPressed,
                  label: "7",
                  child: const Text("7", style: textStyle),
                ),
                Button(
                  onPressed: onPressed,
                  label: "8",
                  child: const Text("8", style: textStyle),
                ),
                Button(
                  onPressed: onPressed,
                  label: "9",
                  child: const Text("9", style: textStyle),
                ),
                Button(
                  onPressed: onPressed,
                  label: "-",
                  child: Text("–", style: greenStyle),
                ),
              ],
            ),
    
            // row 3
    
            RowKeys(
              children: [
                Button(
                  onPressed: onPressed,
                  label: "4",
                  child: const Text("4", style: textStyle),
                ),
                Button(
                  onPressed: onPressed,
                  label: "5",
                  child: const Text("5", style: textStyle),
                ),
                Button(
                  onPressed: onPressed,
                  label: "6",
                  child: const Text("6", style: textStyle),
                ),
                Button(
                  onPressed: onPressed,
                  label: "+",
                  child: Text("+", style: greenStyle),
                ),
              ],
            ),
    
            RowKeys(
              children: [
                Button(
                  onPressed: onPressed,
                  label: "1",
                  child: const Text("1", style: textStyle),
                ),
                Button(
                  onPressed: onPressed,
                  label: "2",
                  child: const Text("2", style: textStyle),
                ),
                Button(
                  onPressed: onPressed,
                  label: "3",
                  child: const Text("3", style: textStyle),
                ),
                Button(
                  onPressed: onPressed,
                  label: "%",
                  child: Text("%", style: greenStyle),
                ),
              ],
            ),
    
            RowKeys(
              children: [
                Button(
                  onPressed: onPressed,
                  label: ".",
                  child: const Text(".", style: textStyle),
                ),
                Button(
                  onPressed: onPressed,
                  label: "0",
                  child: const Text("0", style: textStyle),
                ),
                GestureDetector(
                  onTap: () => onPressed("="),
                  child: Container(
                    width: 140.0,
                    height: 60.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: theme.primaryColor,
                    ),
                    child: const Center(
                      child: Text(
                        "=",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: fontSize,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class RowKeys extends StatelessWidget {
  final List<Widget> children;

  const RowKeys({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: children,
    );
  }
}

class Button extends StatelessWidget {
  final Widget child;
  final String label;
  final Function(String) onPressed;

  const Button({
    super.key,
    required this.onPressed,
    required this.child,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60.0,
      height: 60.0,
      child: IconButton(onPressed: () => onPressed(label), icon: child),
    );
  }
}
