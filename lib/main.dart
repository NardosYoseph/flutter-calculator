import 'package:flutter/material.dart';
import 'package:myapp/buttons.dart';
import 'dart:math' as math;
import 'package:math_expressions/math_expressions.dart';


void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My app', // used by the OS task switcher
      home: SafeArea(
        child: HomePage(),
      ),
    ),
  );
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var userquestion = '';
  var useranswer = '';
  final List<String> buttons = [
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
      backgroundColor: Colors.deepPurple[100],
      body: Column(
        children: [
          Expanded(
            
              child: Container(
                padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(height:50),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(userquestion, style:TextStyle(fontSize: 20),),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  child: Text(useranswer, style:TextStyle(fontSize: 20),),
                )
              ],
            ),
          )),
          Expanded(
              flex: 2,
              child: Container(
                
                  child: GridView.builder(
                      itemCount: buttons.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4),
                      itemBuilder: (BuildContext context, int index) {
                        if (index == 0) {
                          return mybutton(
                            buttontapped: (){
                              setState(() {
                                userquestion='';
                                useranswer='';
                              });
                            },
                            buttonText: buttons[index],
                            color: Colors.green,
                            textcolor: Colors.white,
                          );
                        } else if (index == 1) {
                          return mybutton(
                            buttontapped: (){
                              setState(() {
                                userquestion=userquestion.substring(0,userquestion.length-1);
                              });
                            },
                            buttonText: buttons[index],
                            color: Colors.red,
                            textcolor: Colors.white,
                          );
                        } 
                        else if (index == buttons.length-1) {
                          return mybutton(
                            buttontapped: (){
                              setState(() {
                                equalpressed();
                              });
                            },
                            buttonText: buttons[index],
                            color: Colors.deepPurple,
                            textcolor: Colors.white,
                          );}
                        else {
                          return mybutton(
                            buttontapped: (){
                              setState(() {
                                userquestion+=buttons[index];
                              });
                            },
                            buttonText: buttons[index],
                            color: isOperator(buttons[index])
                                ? Colors.deepPurple
                                : Colors.deepPurple[50],
                            textcolor: isOperator(buttons[index])
                                ? Colors.white
                                : Colors.deepPurple,
                          );
                        }
                      })))
        ],
      ),
    );
  }

  bool isOperator(String x) {
    if (x == '%' || x == '-' || x == '+' || x == '=' || x == '/' || x == '*') {
      return true;
    }
    {
      return false;
    }
  }
  void equalpressed(){
    String finalquestion=userquestion;
    finalquestion=finalquestion.replaceAll('x','*');
    Parser p = Parser();
  Expression exp = p.parse(finalquestion);
  ContextModel cm = ContextModel();
  double eval = exp.evaluate(EvaluationType.REAL, cm);

  useranswer=eval.toString();
  }
}
