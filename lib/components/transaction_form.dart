import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double) onSubmit;

  TransactionForm(this.onSubmit);

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final titleModel = TextEditingController();

  final valueModel = TextEditingController();

  _submitForm() {
    final title = titleModel.text;
    final value = double.tryParse(valueModel.text) ?? 0;
    if (title.isEmpty || value <= 0) {
      return;
    }
    widget.onSubmit(title, value);
  }

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
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                onSubmitted: (value) => _submitForm(),
                decoration: const InputDecoration(
                  labelText: 'Valor (R\$)',
                ),
              ),
              ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll<Color>(Colors.purple),
                ),
                onPressed: _submitForm,
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
