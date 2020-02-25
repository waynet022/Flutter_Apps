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
      'answers': ['Black', 'Red', 'Green', 'White'],
    },

    {
      'questionText': 'what\'s your favorite animal?',
      'answers': ['Dog', 'Cat', 'Rabbit', 'Snake'],
    },

    {
      'questionText': 'what\'s your favorite fruit?',
      'answers': ['Orange', 'Apple', 'Watermelon', 'Peach'],
    },

  ];

  var _questionIndex = 0;

  void _answerQuestion() {
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
            : Result(),
          ),
      );
  }
}
