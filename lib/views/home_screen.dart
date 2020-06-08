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
  Color colorResult;

  _handleResetForm() {
    _valueAltura.text = "";
    _valueMassa.text = "";
  }

  _handleCalculateImc() {
    final massa = double.tryParse(_valueMassa.text) ?? 0.0;
    final altura = double.tryParse(_valueAltura.text) ?? 0.0;

    setState(() {
      _imcvalue = massa / (altura * altura);
    });

    if (_imcvalue < 18.5) {
      resposta = 'Abaixo do peso';
      colorResult = Colors.amber;
    } else if (_imcvalue >= 18.5 && _imcvalue <= 24.9) {
      resposta = 'Peso normal';
      colorResult = Colors.green;
    } else if (_imcvalue >= 25 && _imcvalue <= 29.9) {
      resposta = 'Sobrepeso';
      colorResult = Colors.yellow;
    } else if (_imcvalue >= 30 && _imcvalue <= 34.9) {
      resposta = 'Obesidade grau I';
      colorResult = Colors.red;
    } else if (_imcvalue >= 35 && _imcvalue <= 39.9) {
      resposta = 'Obesidade grau II';
      colorResult = Colors.red;
    } else if (_imcvalue >= 40) {
      resposta = 'Obesidade grau III';
      colorResult = Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora de I.M.C'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            color: Colors.white,
            onPressed: _handleResetForm,
          ),
        ],
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
            color: colorResult,
            resultadoImc:
                _valueMassa.text.length == 0 || _valueAltura.text.length == 0
                    ? Text('Os campos não podem ser vázios!')
                    : Text(
                        resposta,
                        style: TextStyle(color: Colors.white, fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
            valorImc:
                _valueMassa.text.length == 0 || _valueAltura.text.length == 0
                    ? null
                    : Text('Seu imc é: ${_imcvalue.toStringAsPrecision(4)}',
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center),
          )
        ],
      ),
    );
  }
}
