import 'package:flutter/material.dart';
import 'question.dart';
import 'answer.dart';

class Quiz extends StatelessWidget {
  final int selectedQuestion;
  final List<Map<String, Object>> questions;
  final void Function(int) onAnswer;

  Quiz({
    required this.questions,
    required this.selectedQuestion,
    required this.onAnswer,
  });

  bool get hasSelectedQuestion {
    return selectedQuestion < questions.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> answers = hasSelectedQuestion
        ? questions[selectedQuestion].cast()['answers']
        : [];
    return Column(
      children: [
        Question(questions[selectedQuestion]['text'].toString()),
        ...answers.map((quest) {
          return Answer(
            quest['text'].toString(),
            () => onAnswer(int.parse(quest['points'].toString())),
          );
        }).toList()
      ],
    );
  }
}
