import 'package:flutter/material.dart';
import 'result.dart';
import 'quiz.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _selectedQuestion = 0;
  var _totalScore = 0;

  final _questions = const [
    {
      'text': 'Qual é a sua cor favorita?',
      'answers': [
        {'text': 'Preto', 'points': 10},
        {'text': 'Vermelho', 'points': 5},
        {'text': 'Amarelo', 'points': 3},
        {'text': 'Azul', 'points': 1},
      ]
    },
    {
      'text': 'Qual é a seu animal favorito?',
      'answers': [
        {'text': 'Cachorro', 'points': 10},
        {'text': 'Gato', 'points': 5},
        {'text': 'Leão', 'points': 3},
        {'text': 'Coelho', 'points': 1},
      ]
    },
    {
      'text': 'Qual é a seu instrutor favorito?',
      'answers': [
        {'text': 'Maria', 'points': 10},
        {'text': 'João', 'points': 5},
        {'text': 'Leo', 'points': 3},
        {'text': 'Pedro', 'points': 1},
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
