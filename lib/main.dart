import 'package:flutter/material.dart';
import './questionario.dart';
import './resultado.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;

  final _perguntas = const [
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': [
        { 'texto': 'Azul', 'pontuacao': 10 },
        { 'texto': 'Vermelho', 'pontuacao': 5 },
        { 'texto': 'Verde', 'pontuacao': 3 },
        { 'texto': 'Amarelo', 'pontuacao': 1 },
      ],
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'respostas': [
        { 'texto': 'Cachorro', 'pontuacao': 10 },
        { 'texto': 'Gato', 'pontuacao': 5 },
        { 'texto': 'Coelho', 'pontuacao': 3 },
        { 'texto': 'Vaca', 'pontuacao': 1 },
      ],
    },
    {
      'texto': 'Qual é o seu instrutor favorito?',
      'respostas': [
        { 'texto': 'Maria', 'pontuacao': 10 },
        { 'texto': 'João', 'pontuacao': 5 },
        { 'texto': 'Pedro', 'pontuacao': 3 },
        { 'texto': 'Léo', 'pontuacao': 1 },
      ],
    },
  ];

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Contexto é passado pelo próprio flutter, serve para qaundo tivermos filhos de componentes

    return MaterialApp(
      // Mesmo que return new MaterialApp; Mas posso abstrair o new
      home: Scaffold(
          appBar: AppBar(
            title: Text('Perguntas'),
          ),
          body: temPerguntaSelecionada
              ? Questionario(
                  perguntas: _perguntas,
                  perguntaSelecionada: _perguntaSelecionada,
                  quandoResponder: _responder,
                )
              : Resultado(_pontuacaoTotal, _reiniciarQuestionario)),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
