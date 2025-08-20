import 'package:flutter/material.dart';

class PersonCounter extends StatelessWidget {
  const PersonCounter({
    super.key,
    required int personCount,
    required this.theme, required this.onDecrement, required this.onIncrement,
  }) : _personCount = personCount;

  final int _personCount;
  final ThemeData theme;
  final VoidCallback onDecrement;
  final VoidCallback onIncrement;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          color: Colors.deepPurple,
          onPressed: onDecrement, icon: Icon(Icons.remove),),
        Text("$_personCount", style: theme.textTheme.titleMedium,),
        IconButton(
          color: Colors.deepPurple,
          onPressed: onIncrement, icon: Icon(Icons.add)),
      ],
    );
  }
}

