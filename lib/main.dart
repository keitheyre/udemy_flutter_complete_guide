import 'package:flutter/material.dart';
import './question.dart';

void main() => runApp(MyApp());

var _questionIndex = 0;

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  void answerQuestion() {
    setState(() {
      _questionIndex += 1;
    });

    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    var questions = [
      "What's your favorite color?",
      "What's your favorite animal?",
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('AppBar Demo'),
        ),
        body: Column(
          children: <Widget>[
            Question(
              questions[_questionIndex],
            ),
            RaisedButton(
              child: Text("Answer 1"),
              onPressed: answerQuestion,
            ),
            RaisedButton(
              child: Text("Answer 2"),
              onPressed: () => print("Answer 2"),
            ),
            RaisedButton(
              child: Text("Answer 3"),
              onPressed: () => print("Answer 3"),
            ),
          ],
        ),
      ),
    );
  }
}
