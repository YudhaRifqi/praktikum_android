import 'package:flutter/material.dart';
import 'package:quiz_app1/datas/questions.dart';
import 'package:quiz_app1/home_screen.dart';
import 'package:quiz_app1/question_screen.dart';
import 'package:quiz_app1/result_screen.dart';

class Quiz extends StatefulWidget {
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  var activeScreen = 'start-screen';
  List<String> selectedAnswer = [];

  void chooseAnswer(String answer) {
    selectedAnswer.add(answer);

    if (selectedAnswer.length == questions.length) {
      setState(() {
        activeScreen = 'result-screen';
      });
    }
  }

  void restartQuiz() {
    setState(() {
      selectedAnswer = [];
      activeScreen = 'questions-screen';
    });
  }

  void switchScreen() {
    setState(() {
      activeScreen = 'question-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = HomeScreen(switchScreen);
    if (activeScreen == 'question-screen') {
      screenWidget = QuizScreen(
        onSelectAnswer: chooseAnswer,
      );
    }

    if (activeScreen == 'result-screen') {
      screenWidget = ResultScreen(
        choosenAnswers: selectedAnswer,
        onRestart: restartQuiz,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.deepPurple, Colors.deepPurple],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight)),
          child: screenWidget,
        ),
      ),
    );
  }
}
