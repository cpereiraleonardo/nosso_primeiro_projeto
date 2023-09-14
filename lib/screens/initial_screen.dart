import 'package:flutter/material.dart';
import 'package:nosso_primeiro_projeto/screens/form_screen.dart';

import '../components/taks.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: const Text('Tarefas'),
      ),
      body: ListView(
        children: const [
          Task('Aprender Flutter', 'assets/images/mascote.png', 3),
          Task('Andar de Bike', 'assets/images/bike.jpg', 2),
          Task('Meditar', 'assets/images/meditacao.jpg', 5),
          Task('Ler', 'assets/images/livro.jpg', 4),
          Task('Jogar', 'assets/images/kako.jpg', 1),
          SizedBox(
            height: 80,
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FormScreen(),
              ));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
