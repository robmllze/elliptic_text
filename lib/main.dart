// Elliptic Text - Example 1

import 'package:elliptic_text/src/ellipse.dart';
import 'package:flutter/material.dart';

//import 'package:elliptic_text/elliptic_text.dart';
import 'elliptic_text.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Text(
              "O    ..    o ",
              style: TextStyle(fontSize: 60.0, color: Colors.blue),
            ),
          ),
          _animate(
            (__value) => Center(
              // Wrap the EllipticText widget in a SizedBox to set its size.
              child: SizedBox(
                height: 450.0,
                width: 300.0,
                child: EllipticText(
                  text: "Smile! :) Why should text always be straight?",
                  style: TextStyle(fontSize: 20.0, color: Colors.blue),
                  // Draw text at the top of the ellipse.
                  perimiterAlignment: EllipticText_PerimiterAlignment.bottom,
                  offset: __value,
                  // Stretch text to half of the circumference.
                  fitFactor: 1 / 2,
                  fitType: EllipticText_FitType.scaleFit,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

final _animate = (final Widget Function(double) child) => TweenAnimationBuilder(
      tween: Tween<double>(
        begin: 0.0,
        end: 30 * ellipseCircumRamanujan1(300.0 / 2.0, 450 / 2.0),
      ),
      duration: Duration(seconds: 60),
      builder: (_, __value, __) => child(__value),
    );