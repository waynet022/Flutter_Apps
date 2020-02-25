import 'package:flutter/material.dart';

@override
class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase{
    String resultText;

    if(resultScore <= 8) {
      resultText =  'You are awesome and innocent!';
    }
    else if(resultScore <= 12){
      resultText = 'Pretty likeable';
    }
    else if(resultScore <= 18){
      resultText = 'You are strange';
    }
    else{
      resultText = 'You are bad';
    }
    return resultText;
  }

  Widget build(BuildContext context) {
    return Center(
        child: Column(
          children: <Widget>[
            Text(
              resultPhrase,
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            FlatButton(
                child: Text('Restart Quiz!'),
                textColor: Colors.blue,
                onPressed: resetHandler
            ),
          ]
        )
    );
  }
}
