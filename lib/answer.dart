import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String texto;
  final void Function() onSelected;
  Answer(this.texto, this.onSelected);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.cyan,
          onSurface: Colors.cyan,
        ),
        onPressed: onSelected,
        child: Text(texto),
      ),
    );
  }
}
