import 'package:flutter/material.dart';
import 'package:prova/screens/form/form_controller.dart';

class FormSreen extends StatefulWidget {
  const FormSreen({super.key});

  @override
  FormSreenState createState() => FormSreenState();
}

class FormSreenState extends State<FormSreen> {
  final _controller = FormsStateController();

  void updateTechs(String option, bool selected) {
    setState(() {
      if (selected) {
        _controller.selectedTechs.add(option);
      } else {
        _controller.selectedTechs.remove(option);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'AVALIAÇÃO',
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                'Quais tecnologias mobile você conhece?',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              Column(
                children: _controller.techs.map((option) {
                  return CheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    title: Text(option),
                    value: _controller.selectedTechs.contains(option),
                    onChanged: (bool? selected) {
                      updateTechs(option, selected!);
                    },
                  );
                }).toList(),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => _controller.mostrarSelecoes(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: _controller.selectedTechs.isEmpty ? Colors.grey : Colors.blueAccent,
                ),
                child: const Text(
                  'ENVIAR',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
