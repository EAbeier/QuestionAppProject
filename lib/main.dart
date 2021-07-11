import 'package:flutter/material.dart';
import 'result.dart';
import 'quiz.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _selectedQuestion = 0;
  var _totalScore = 0;

  final _questions = const [
    {
      'text': 'Wich is your favorite color?',
      'answers': [
        {'text': 'Black', 'points': 10},
        {'text': 'Red', 'points': 5},
        {'text': 'Yellow', 'points': 3},
        {'text': 'Blue', 'points': 1},
      ]
    },
    {
      'text': 'Wich is your favorite animal?',
      'answers': [
        {'text': 'Dog', 'points': 10},
        {'text': 'Cat', 'points': 5},
        {'text': 'Lion', 'points': 3},
        {'text': 'Rabit', 'points': 1},
      ]
    },
    {
      'text': 'Wich is your favorite hollywood actor?',
      'answers': [
        {'text': 'Tom Hanks', 'points': 10},
        {'text': 'Dwayne Johnson', 'points': 5},
        {'text': 'Leonardo DiCaprio', 'points': 3},
        {'text': 'Robert Downey Jr.', 'points': 1},
      ]
    }
  ];

  void _answer(int points) {
    if (temPerguntaSelecionada) {
      setState(() {
        _selectedQuestion++;
        _totalScore += points;
      });
    }
  }

  void _resetQuiz() {
    setState(() {
      _selectedQuestion = 0;
      _totalScore = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _selectedQuestion < _questions.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.cyan,
            title: Text('Answers'),
          ),
          body: temPerguntaSelecionada
              ? Quiz(
                  questions: _questions,
                  selectedQuestion: _selectedQuestion,
                  onAnswer: _answer)
              : Result(_totalScore, _resetQuiz)),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  @override
  _PerguntaAppState createState() {
    return new _PerguntaAppState();
  }
}
