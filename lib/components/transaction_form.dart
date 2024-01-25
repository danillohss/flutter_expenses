import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  final titleModel = TextEditingController();
  final valueModel = TextEditingController();

  final void Function(String, double) onSubmit;

  TransactionForm(this.onSubmit);

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              TextField(
                controller: titleModel,
                decoration: const InputDecoration(
                  labelText: 'Título',
                ),
              ),
              TextField(
                controller: valueModel,
                decoration: const InputDecoration(
                  labelText: 'Valor (R\$)',
                ),
              ),
              ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll<Color>(Colors.purple),
                ),
                onPressed: () {
                  final title = titleModel.text;
                  final value = double.tryParse(valueModel.text) ?? 0;
                  onSubmit(title, value);
                },
                child: const Text(
                  'Cadastrar',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ));
  }
}
