import 'package:flutter/material.dart';
import 'package:calculator_application/calculator.dart';

class Custom_Button extends StatelessWidget {
  String button;
  var button_color;
  final buttonTaped;

  Custom_Button(
      {required this.button, required this.buttonTaped, button_color});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: buttonTaped,
        child: Container(
            decoration: BoxDecoration(
                color: Colors.amber.shade700,
                borderRadius: BorderRadius.all(Radius.circular(8.0))),
            margin: EdgeInsets.all(6.0),
            padding: EdgeInsets.all(8.0),
            child: Center(
                child: Text(
              button,
              style: TextStyle(fontSize: 20),
            ))),
      ),
    );
  }
}
