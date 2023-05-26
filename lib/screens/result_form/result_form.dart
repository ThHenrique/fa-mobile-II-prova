import 'package:flutter/material.dart';

class ResultForm extends StatelessWidget {
  final List<String> resultForm;

  const ResultForm({Key? key, required this.resultForm}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Avaliação'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Tecnologias selecionadas:',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            Container(
              margin: const EdgeInsets.all(15.0),
              padding: const EdgeInsets.all(3.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blueAccent),
                borderRadius: BorderRadius.circular(5),
              ),
              child: ListView.separated(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemCount: resultForm.length,
                separatorBuilder: (_, int index) => const Padding(
                  padding: EdgeInsets.symmetric(vertical: 1.0),
                ),
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      resultForm[index],
                      style: const TextStyle(color: Colors.black87, fontWeight: FontWeight.w600),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 100.0),
            const Text(
              'Informações enviadas ao servidor...',
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
