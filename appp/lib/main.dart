import 'package:flutter/material.dart';
import 'Screen/Animated/animated4.dart';
// import 'Screen/Animations/animated1.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.red,
    ),
    home: AnimatiedBottonNavagation(title: "Animation Bottom Navagations"),
  ));
}
