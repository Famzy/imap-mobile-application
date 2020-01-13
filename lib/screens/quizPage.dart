import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:i_map/utils/constants/QuizChoices.dart';
import 'package:i_map/utils/constants/QuizCorrectAnswer.dart';
import 'package:i_map/utils/constants/QuizQuestions.dart';

import 'homePage.dart';

var finalScore = 0;
var quizNumber = 0;
var quiz = new QuizQuestions();
String questions = questions;

class AlphabetQuiz extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new AlphabetquizState();
  }
}

class AlphabetquizState extends State<AlphabetQuiz> {
  @override
  initState() {
    super.initState();
    initTts();
  }

  initTts() {
    flutterTts.setLanguage('en-US');
    flutterTts.setSpeechRate(2.0);
    flutterTts.setVolume(1.0);
    flutterTts.setPitch(1.0);
  }

  bool isPlaying = false;
  final FlutterTts flutterTts = FlutterTts();

  Future _speak() async {
    if (questions != null && questions.isNotEmpty) {
      var result = await flutterTts.speak(questions);
      if (result == 1)
        setState(() {
          isPlaying = true;
        });
    }
  }

  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: new Container(
          margin: const EdgeInsets.all(10.0),
          alignment: Alignment.topCenter,
          child: new Column(
            children: <Widget>[
              new Padding(
                padding: EdgeInsets.all(20),
              ),
              new Container(
                alignment: Alignment.center,
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Text(
                        'Question  ${quizNumber + 1} of ${quiz.questions.length}',
                        style: new TextStyle(
                          fontSize: 22.0,
                        )),
                    new Text(
                      'Score: $finalScore',
                      style: new TextStyle(fontSize: 22.0),
                    )
                  ],
                ),
              ),
              new Padding(
                padding: EdgeInsets.all(10.0),
              ),
              new Text(
                quiz.questions[quizNumber],
                style: TextStyle(fontSize: 30.0),
              ),
              new Padding(
                padding: EdgeInsets.all(10.0),
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  new Container(
                      width: 150.0,
                      height: 150.0,
                      child: FlatButton(
                        onPressed: () {
                          if (QuizChoices.choices[quizNumber][0] ==
                              QuizCorrectAnswer.correctAnswer[quizNumber]) {
                            debugPrint('Correct');
                            setState(() {
                              _speak();
                            });
                            finalScore++;
                          } else {
                            if (QuizChoices.choices[quizNumber][0] !=
                                QuizCorrectAnswer.correctAnswer[quizNumber]) {
                              return QuizChoices.choices[quizNumber][0];
                            }
                            debugPrint('Wrong');
                            setState(() {
                              _speak();
                            });
                          }
                          updateQuestion();
                        },
                        child: new Image.asset(
                            'assets/${QuizChoices.choices[quizNumber][0]}.png'),
                      )),
                  new Container(
                      width: 150.0,
                      height: 150.0,
                      child: FlatButton(
                        onPressed: () {
                          if (QuizChoices.choices[quizNumber][1] ==
                              QuizCorrectAnswer.correctAnswer[quizNumber]) {
                            debugPrint('Correct');
                            finalScore++;
                          } else {
                            debugPrint('Wrong');
                            return QuizChoices.choices[quizNumber][1];
                          }
                          updateQuestion();
                        },
                        child: new Image.asset(
                            'assets/${QuizChoices.choices[quizNumber][1]}.png'),
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void updateQuestion() {
    setState(() {
      if (quizNumber == quiz.questions.length - 1) {
        Navigator.push(context,
            new MaterialPageRoute(builder: (context) => new HomePage()));
      } else {
        quizNumber++;
      }
    });
  }
}
