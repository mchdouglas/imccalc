
import 'package:flutter/material.dart';
import 'package:imccalc/widgets/resultado.dart';
import 'package:imccalc/widgets/userinfo_form.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _valueMassa = TextEditingController();
  final _valueAltura = TextEditingController();
  double _imcvalue = 0;
  String resposta = '';

  _handleCalculateImc() {
    final massa = double.tryParse(_valueMassa.text) ?? 0.0;
    final altura = double.tryParse(_valueAltura.text) ?? 0.0;

    setState(() {
      _imcvalue = massa / (altura * altura);
    });

    if (_imcvalue < 18.5) {
      resposta = 'Abaixo do peso';
    } else if (_imcvalue >= 18.5 && _imcvalue <= 24.9) {
      resposta = 'Peso normal';
    } else if (_imcvalue >= 25 && _imcvalue <= 29.9) {
      resposta = 'Sobrepeso';
    } else if (_imcvalue >= 30 && _imcvalue <= 34.9) {
      resposta = 'Obesidade grau I';
    } else if (_imcvalue >= 35 && _imcvalue <= 39.9) {
      resposta = 'Obesidade grau II';
    } else if (_imcvalue >= 40) {
      resposta = 'Obesidade grau III';
    } else {
      resposta = 'Por favor informe valores válidos';
      _imcvalue=0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora de I.M.C'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          UserinfoForm(
            controller: _valueMassa,
            icon: Icon(Icons.touch_app),
            placeholder: 'em kg',
            labelText: 'Massa',
          ),
          UserinfoForm(
            icon: Icon(Icons.touch_app),
            controller: _valueAltura,
            placeholder: 'em metros',
            labelText: 'Altura',
          ),
          ButtonTheme(
            minWidth: double.infinity,
            child: RaisedButton(
              color: Theme.of(context).primaryColor,
              textColor: Colors.white,
              child: Text('Calcular'),
              onPressed: _handleCalculateImc,
            ),
          ),
          Resultado(
            resultadoImc: Text(resposta),
            valorImc: Text('Seu imc é: ${_imcvalue.toStringAsPrecision(4)}'),
          )
        ],
      ),
    );
  }
}
