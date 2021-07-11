import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int score;
  final void Function() _onResetQuiz;
  Result(this.score, this._onResetQuiz);

  String get resultQuote {
    if (score < 8) {
      return 'Congratulations !';
    } else if (score < 12) {
      return 'Awsome';
    } else if (score < 16) {
      return 'You rock!';
    } else {
      return 'You\'re a jedi master';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            resultQuote,
            style: TextStyle(
              fontSize: 28,
              fontFamily: 'Fira Code',
            ),
          ),
        ),
        TextButton(
            onPressed: _onResetQuiz,
            child: Text(
              'Restar quiz!',
              style: TextStyle(
                color: Colors.cyan,
                fontFamily: 'Fira Code',
              ),
            )),
      ],
    );
  }
}
