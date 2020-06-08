import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final resultadoImc;
  final valorImc;
  final  color;

  Resultado({
    this.resultadoImc,
    this.valorImc,
    this.color
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: color,
      child: ListTile(
        title: resultadoImc,
        subtitle: valorImc,
      ),
    );
  }
}
