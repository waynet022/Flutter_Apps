import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

@override
class MyApp extends StatefulWidget {
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'what\'s your favorite color?',
      'answers': [
        {'text' : 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text' : 'White', 'score': 1}
      ],
    },

    {
      'questionText': 'what\'s your favorite animal?',
      'answers': [
        {'text' : 'Dog', 'score': 10},
        {'text': 'Cat', 'score': 5},
        {'text': 'Goldfish', 'score': 3},
      ],
    },

    {
      'questionText': 'what\'s your favorite fruit?',
      'answers': [
        {'text' : 'Orange', 'score': 10},
        {'text': 'Apple', 'score': 5},
        {'text': 'Banana', 'score': 3},
        {'text' : 'Kiwi', 'score': 1}],
    },

  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz(){
    setState((){
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(()
      {
        _questionIndex +=1;
      }
    );
    print(_questionIndex);

    if(_questionIndex < _questions.length){
      print('We have more questions');
    }
    else{
      print('no more questions');
    }
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                  answerQuestion: _answerQuestion,
                  questionIndex: _questionIndex,
                  questions:_questions
              )
            : Result(_totalScore, _resetQuiz),
          ),
      );
  }
}
