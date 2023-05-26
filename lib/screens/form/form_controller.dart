import 'package:flutter/material.dart';
import 'package:prova/screens/result_form/result_form.dart';

class FormsStateController {
  List<String> techs = ['Flutter', 'React Native', 'Kotlin', 'Java', 'Ionic'];
  List<String> selectedTechs = [];

  void mostrarSelecoes(BuildContext context) {
    if (selectedTechs.isEmpty) return;

    Navigator.push(
      context,
      MaterialPageRoute(builder: (BuildContext context) {
        return ResultForm(resultForm: selectedTechs);
      }),
    );
  }
}
