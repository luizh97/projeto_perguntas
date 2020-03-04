import 'package:flutter/material.dart';

main() => runApp(PerguntaApp());

class PerguntaApp extends StatelessWidget {
  var perguntaSelecionada = 0;
  
  void responder() {
    // perguntaSelecionada++;
    print(perguntaSelecionada);
  }
  
  final List<String> perguntas = [
    'Qual é a sua cor favorita?',
    'Qual é o seu animal favorito?',
  ];

  @override
  Widget build(BuildContext context) { // Contexto é passado pelo próprio flutter, serve para qaundo tivermos filhos de componentes
    return MaterialApp( // Mesmo que return new MaterialApp; Mas posso abstrair o new
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
        ),
        body: Column(
          children: <Widget>[
            Text(perguntas[perguntaSelecionada]),
            RaisedButton(
              child: Text('Resposta 1'),
              onPressed: responder,
            ),
            RaisedButton(
              child: Text('Resposta 2'),
              onPressed: responder,
            ),
            RaisedButton(
              child: Text('Resposta 3'),
              onPressed: responder,
            ),
          ],
        ),
      ),
    );
  }

}

