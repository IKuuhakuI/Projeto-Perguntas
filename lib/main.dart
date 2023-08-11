import 'package:flutter/material.dart';
import 'questionario.dart';
import './resultado.dart';

main() {
  runApp(_PerguntaApp());
}

class _PerguntaAppState extends State<_PerguntaApp> {
  int _perguntaSelecionada = 0;
  int _pontoTotal = 0;

  final List<Map<String, Object>> _perguntas = const [
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': [
        {'texto': 'Preto', 'ponto': 10},
        {'texto': 'Vermelho', 'ponto': 5},
        {'texto': 'Verde', 'ponto': 3},
        {'texto': 'Branco', 'ponto': 1}
      ],
    },
    {
      'texto': 'Qual o seu animal favorito?',
      'respostas': [
        {'texto': 'Coelho', 'ponto': 10},
        {'texto': 'Cobra', 'ponto': 5},
        {'texto': 'Elefante', 'ponto': 3},
        {'texto': 'Leão', 'ponto': 1},
      ],
    },
    {
      'texto': 'Qual o seu instrutor favorito?',
      'respostas': [
        {'texto': 'Maria', 'ponto': 10},
        {'texto': 'João', 'ponto': 5},
        {'texto': 'Leo', 'ponto': 3},
        {'texto': 'Pedro', 'ponto': 1},
      ],
    },
  ];

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  void _responder(int ponto) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontoTotal += ponto;
      });
    }

    print(_pontoTotal);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Perguntas'),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                responder: _responder,
                temPerguntaSelecionada: temPerguntaSelecionada,
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
