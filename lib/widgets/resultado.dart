import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final resultadoImc;
  final valorImc;

  Resultado({
    this.resultadoImc,
    this.valorImc,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: ListTile(
          title: resultadoImc,
          subtitle: valorImc,
        ),
      ),
    );
  }
}
