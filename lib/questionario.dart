import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final void Function(int) quandoResponder;

  Questionario({ 
    @required this.perguntas,
    @required this.perguntaSelecionada,
    @required this.quandoResponder,
  });
  
  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    // Método Imperativo
    // List<Widget> respostas = [];
    // for(String textoResp in perguntas[_perguntaSelecionada]['respostas']) {
    //   respostas.add(Resposta(textoResp, _responder));
    // }
    
    // Método Declarativo
    List<Map<String, Object>>  respostas = temPerguntaSelecionada 
      ? perguntas[perguntaSelecionada]['respostas']
      : null;

    return Column(
      children: <Widget>[
        Questao(perguntas[perguntaSelecionada]['texto']),
        ...respostas
          .map((resp) => Resposta(resp['texto'], () => quandoResponder(resp['pontuacao'])))
          .toList(),
      ],
    );
  }
}