import 'package:calculator_application/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  var userqustion = "";
  var useranswer = "";
  List<String> button_name = [
    'C',
    'DEL',
    '%',
    '/',
    '9',
    '8',
    '7',
    '*',
    '6',
    '5',
    '4',
    '-',
    '3',
    '2',
    '1',
    '+',
    '0',
    '.',
    'ANS',
    '=',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Column(
        children: [
          Expanded(
              child: Container(
            padding: EdgeInsets.all(12),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(userqustion,
                      style: TextStyle(
                        fontSize: 30,
                      )),
                  Text(useranswer, style: TextStyle(fontSize: 30)),
                ]),
            width: double.infinity,
            color: Colors.grey,
          )),
          Expanded(
            flex: 3,
            child: Container(
                height: MediaQuery.of(context).size.height,
                color: Colors.grey,
                child: GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    primary: false,
                    itemCount: button_name.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4),
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return Custom_Button(
                          button: button_name[index],
                          buttonTaped: () {
                            setState(() {
                              userqustion = '';
                              useranswer = '';
                              print('great');
                            });
                          },
                        );
                      } else if (index == 1) {
                        return Custom_Button(
                          button: button_name[index],
                          buttonTaped: () {
                            setState(() {
                              userqustion = userqustion.substring(
                                  0, userqustion.length - 1);
                              print('great');
                            });
                          },
                        );
                      } else if (index == button_name.length - 1 ||
                          index == button_name.length - 2) {
                        return Custom_Button(
                          button: button_name[index],
                          buttonTaped: () {
                            setState(() {
                              equalpressed();
                              print('great');
                            });
                          },
                        );
                      } else {
                        return Custom_Button(
                          button: button_name[index],
                          buttonTaped: () {
                            setState(() {
                              userqustion = userqustion + button_name[index];
                              print('great');
                            });
                          },
                        );
                      }
                    })),
          ),
        ],
      ),
    );
  }

  void equalpressed() {
    String finalquestion = userqustion;

    Parser p = Parser();
    Expression exp = p.parse(finalquestion);

    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    useranswer = eval.toString();
  }
}
