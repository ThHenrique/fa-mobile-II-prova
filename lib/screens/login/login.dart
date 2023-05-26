import 'package:flutter/material.dart';
import 'package:prova/screens/form/form.dart';
import 'package:prova/shared/utils/validade_input.dart';
import 'package:prova/shared/widgets/input.dart';

// Classe que instância classe responsável por gerenciar estados
class Login extends StatefulWidget {
  const Login({super.key});

  @override
  LoginState createState() => LoginState();
}

// classe que contém os widgets
class LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();

  final validator = InputValidator();

  var username = '', password = '', formMessage = '';

  bool isValidForm(BuildContext context) {
    setState(() {
      formMessage = "";
    });

    if (!formKey.currentState!.validate()) {
      return false;
    }
    formKey.currentState!.save();

    if (username != "teste" || password != "123") {
      setState(() {
        formMessage = "Acesso não permitido";
      });
      return false;
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (BuildContext context) {
        return const FormSreen();
      }),
    );

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // barra do aplicativo
        title: const Text(
          'AVALIAÇÃO',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        // corpo do aplicativo
        child: Container(
          margin: const EdgeInsets.all(15.0),
          padding: const EdgeInsets.all(3.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const Text(
                  'Preencha para acessar:',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 16.0),
                Input(
                  label: 'Usuário',
                  icon: const Icon(Icons.account_circle_outlined),
                  validator: validator.validateText,
                  onSaved: (String value) => username = value,
                ),
                const SizedBox(height: 12.0),
                Input(
                  label: 'Senha',
                  icon: const Icon(Icons.vpn_key),
                  validator: validator.validateText,
                  onSaved: (String value) => password = value,
                ),
                const SizedBox(height: 16.0),
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: 300,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                      onPressed: () => isValidForm(context), // executa _enviar
                      child: const Text(
                        'ENTRAR',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                formMessage.isNotEmpty
                    ? Text(
                        formMessage,
                        style: const TextStyle(color: Colors.redAccent, fontWeight: FontWeight.w500),
                      )
                    : Container()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
