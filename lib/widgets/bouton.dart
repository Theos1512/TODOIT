// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:todoit/utilities/color.dart';

class MyButton extends StatelessWidget {
 MyButton({super.key, required this.buttontext, required this.onPressed});
  final String buttontext;
  VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: color.alternateColor,
      onPressed: onPressed,
      child: Text(buttontext),
    );
  }
}
