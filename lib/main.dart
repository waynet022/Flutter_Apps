import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

void main() => runApp(MyApp());

@override
class MyApp extends StatefulWidget {
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final questions = const [
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

    if(_questionIndex < questions.length){
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
        body: _questionIndex < questions.length
            ?Column(
              children: [
                Question(
                  questions[_questionIndex]['questionText'],
                ),
                ...(questions[_questionIndex]['answers'] as List<String>)
                  .map((answer) {
                  return Answer(_answerQuestion, answer);
                }).toList()
            ],
          ) : Center(child: Text('you did it'),
          ),
      ),
    );
  }
}
