import 'package:flutter/material.dart';

class TotalPerPerson extends StatelessWidget {
  const TotalPerPerson({
    super.key,
    required this.style,
    required this.total,
    required this.theme,
  });

  final TextStyle style;
  final double total;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: Colors.deepPurple,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          children: [
            Text('Total Per Person',
            style: style),
            Text(total.toStringAsFixed(2),
            style: style.copyWith(
             color: theme.colorScheme.onPrimary,
             fontSize: theme.textTheme.displaySmall?.fontSize,
            ),),
          ],
        )),
    );
  }
}