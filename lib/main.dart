import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/result.dart';

import './quiz.dart';
import 'result.dart';

void main() => runApp(MyApp());

var _questionIndex = 0;
var _totalScore = 0;

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      "question": "What's your favorite color?",
      "answers": [
        {"text": "Black", "score": 10},
        {"text": "Red", "score": 5},
        {"text": "Green", "score": 3},
        {"text": "White", "score": 1}
      ]
    },
    {
      "question": "What's your favorite animal?",
      "answers": [
        {"text": "Rabbit", "score": 3},
        {"text": "Elephant", "score": 11},
        {"text": "Snake", "score": 5},
        {"text": "Lion", "score": 9}
      ]
    },
    {
      "question": "Who is your favorite band?",
      "answers": [
        {"text": "Nirvana", "score": 2},
        {"text": "The Who", "score": 5},
        {"text": "Metallica", "score": 8},
        {"text": "Kins of Leon", "score": 2}
      ]
    },
  ];

  void _answerQuestion(int score) {
    //add to the total score
    _totalScore += score;

    setState(() {
      _questionIndex += 1;
    });

    if (_questionIndex < _questions.length) {
      print("We have more questions");
    }
  }

  void _resetQuiz() {
    //Do in setState so the build method rebuilds the tree
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Quiz App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
