import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontos;

  const Resultado(this.pontos, {super.key});

  String get fraseResultado {
    if (pontos < 8) {
      return 'Parabéns!';
    } else if (pontos < 12) {
      return 'Você é bom!';
    } else if (pontos < 16) {
      return 'Impressionante!';
    } else {
      return 'Nível Jedi!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        fraseResultado,
        style: const TextStyle(fontSize: 28),
      ),
    );
  }
}
