import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';
import './resultado.dart';

main() {
  runApp(_PerguntaApp());
}

class _PerguntaAppState extends State<_PerguntaApp> {
  int _perguntaSelecionada = 0;
  final List<Map<String, Object>> _perguntas = const [
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': ['Preto', 'Vermelho', 'Verde', 'Branco'],
    },
    {
      'texto': 'Qual o seu animal favorito?',
      'respostas': ['Coelho', 'Cobra', 'Elefante', 'Leão'],
    },
    {
      'texto': 'Qual o seu instrutor favorito?',
      'respostas': ['Maria', 'João', 'Leo', 'Pedro'],
    },
  ];

  void _responder() {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
      });
    }
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<String> respostas = temPerguntaSelecionada
        ? _perguntas[_perguntaSelecionada]['respostas'] as List<String>
        : [];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Perguntas'),
        ),
        body: temPerguntaSelecionada
            ? Column(
                children: <Widget>[
                  Questao(_perguntas[_perguntaSelecionada]['texto'] as String),
                  ...respostas
                      .map((texto) => Resposta(texto, _responder))
                      .toList(),
                ],
              )
            : const Resultado(),
      ),
    );
  }
}

class _PerguntaApp extends StatefulWidget {
  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
