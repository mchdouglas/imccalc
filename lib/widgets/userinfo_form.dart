import 'package:flutter/material.dart';

class UserinfoForm extends StatelessWidget {
  final placeholder;
  final labelText;
  final icon;
  final TextEditingController controller;

  UserinfoForm({this.placeholder, this.labelText, this.controller, this.icon});
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          hintText: placeholder,
          labelText: labelText,
          icon: icon,
        ),
      ),
    );
  }
}
