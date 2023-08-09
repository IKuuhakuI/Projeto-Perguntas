import 'package:flutter/material.dart';

main() {
  runApp(new PerguntaApp());
}

class PerguntaApp extends StatelessWidget {
  String? name;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Perguntas'),
        ),
        body: const Text('Olá Flutter!!!'),
      ),
    );
  }
}
