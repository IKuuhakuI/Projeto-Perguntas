import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final void Function() responder;
  final bool temPerguntaSelecionada;

  const Questionario({
    required this.perguntas,
    required this.perguntaSelecionada,
    required this.responder,
    required this.temPerguntaSelecionada,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = temPerguntaSelecionada
        ? perguntas[perguntaSelecionada]['respostas']
            as List<Map<String, Object>>
        : [];

    return Column(
      children: <Widget>[
        Questao(perguntas[perguntaSelecionada]['texto'] as String),
        ...respostas
            .map((resposta) => Resposta(resposta['texto'] as String, responder))
            .toList(),
      ],
    );
  }
}
