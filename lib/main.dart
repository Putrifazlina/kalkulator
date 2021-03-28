import 'package:math_expressions/math_expressions.dart';
import 'package:flutter/material.dart';
import './Widgets/CalcButton.dart';

void main() {
  runApp(CalcApp());
}


class CalcApp extends StatefulWidget {
  const CalcApp({Key key}) : super(key: key);

  @override
  CalcAppState createState() => CalcAppState();
}


class CalcAppState extends State<CalcApp> {

  String _history ='';
  String _expression ='' ;

  void numClick (String text){
    setState(() {
      _expression += text;
    });
  }

  void allClear (String text){
    setState(() {
      _history = '';
      _expression = '';
    });
  }

  void Clear (String text){
    setState(() {
      _expression = '';
    });
  }

  void evaluate(String text){
    Parser p = Parser();
    Expression exp = p.parse(_expression);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    setState(() {
      _history = _expression;
      _expression = eval.toString();
    });
  }



  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kalkulator_putri',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Kalkulatorku'),
          centerTitle: true,
          backgroundColor: Colors.amber,
        ),
        backgroundColor: Colors.white70,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
        children : <Widget>[
          Container(
            padding: EdgeInsets.only(right: 12),
            child: Text( _history,
              style: TextStyle(
                fontSize: 27,
                color: Colors.white70,
              ),
            ),
            alignment : Alignment(1 , 1 ),
          ),
          Container(
            padding: EdgeInsets.all(12),
            child: Text(_expression,
              style: TextStyle(
                fontSize: 55,
                color: Colors.white,
              ),
            ),
            alignment : Alignment(1 , 1 ),
          ),
          SizedBox(height: 35,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text('________________________________________________________')
            ],
          ),
          Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            CalcButton (
              text :'AC',
              fillColor: 0xFF6c807F,
              textSize: 20,
              callback: allClear,),
            CalcButton (
              text :'C',
              fillColor: 0xFF6c807F,
              textSize: 20,
              callback: Clear,),
            CalcButton (
              text :'%',
              fillColor: 0xFFFFFFFF,
              textColor: 0xFF6c807F,
              textSize: 20,
              callback: numClick,),
            CalcButton (
              text :'/',
              fillColor: 0xFFFFFFFF,
              textColor: 0xFF6c807F,
              textSize: 20,
              callback: numClick,),
          ],
        ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              CalcButton (
                text :'7',
                textColor: 0xFF6c807F,
                textSize: 40,
                callback: numClick,),
              CalcButton (
                text :'8',
                textColor: 0xFF6c807F,
                textSize: 40,
                callback: numClick,),
              CalcButton (
                text :'9',
                textColor: 0xFF6c807F,
                textSize: 40,
                callback: numClick,),
              CalcButton (
                text :'+',
                fillColor: 0xFFFFFFFF,
                textColor: 0xFF6c807F,
                textSize: 20,
                callback: numClick,),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              CalcButton (
                text :'4',
                textColor: 0xFF6c807F,
                textSize: 40,
                callback: numClick,),
              CalcButton (
                text :'5',
                textColor: 0xFF6c807F,
                textSize: 40,
                callback: numClick,),
              CalcButton (
                text :'6',
                textColor: 0xFF6c807F,
                textSize: 40,
                callback: numClick,),
              CalcButton (
                text :'-',
                fillColor: 0xFFFFFFFF,
                textColor: 0xFF6c807F,
                callback: numClick,),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              CalcButton (
                text :'1',
                textColor: 0xFF6c807F,
                textSize: 40,
              callback: numClick,),
              CalcButton (
                text :'2',
                textColor: 0xFF6c807F,
                textSize: 40,
                callback: numClick,),
              CalcButton (
                text :'3',
                textColor: 0xFF6c807F,
                textSize: 40,
                callback: numClick,),
              CalcButton (
                text :'*',
                fillColor: 0xFFFFFFFF,
                textColor: 0xFF6c807F,
                textSize: 20,
                callback: numClick,),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              CalcButton (
                text :'.',
                textColor: 0xFF6c807F,
                textSize: 40,
                callback: numClick,),
              CalcButton (
                text :'0',
                textColor: 0xFF6c807F,
                textSize: 40,
                callback: numClick,),
              CalcButton (
                text :'00',
                textColor: 0xFF6c807F,
                textSize: 29,
                callback: numClick,),
              CalcButton (
                text :'=',
                fillColor: 0xFFFFFFFF,
                textColor: 0xFF6c807F,
                textSize: 20,
                callback: evaluate, ),
            ],
          ),
        ],
        ),
      ),
    );
  }
}
// fillColor: 0xFFFFFFFF,
// textColor: 0xFF000000,