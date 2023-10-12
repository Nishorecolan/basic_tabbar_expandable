import 'package:flutter/material.dart';

buildText(
    {String name = '',
    double fontSize = 14,
    FontWeight fontWeight = FontWeight.w500,
    Color fontColor = Colors.black}) {
  return Text(name,
      style: TextStyle(
          fontSize: fontSize, fontWeight: fontWeight, color: fontColor));
}