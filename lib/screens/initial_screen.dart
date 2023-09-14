import 'package:flutter/material.dart';
import 'package:nosso_primeiro_projeto/data/task_inherited.dart';
import 'package:nosso_primeiro_projeto/screens/form_screen.dart';

import '../components/taks.dart';

// ignore: must_be_immutable
class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  double levelGlobal = 0.0;
  double progress = 0.0;

  void calculateLevelGlobal(List<Task> taskList) {
    levelGlobal = 0;
    progress = 0;

    for (var i = 0; i < taskList.length; i++) {
      levelGlobal += (taskList[i].nivel * taskList[i].dificuldade) /10 ;
    }

    setState(() {
        progress = levelGlobal / 100;     
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title:  Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Tarefas'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 200,
                  child: LinearProgressIndicator(
                    value: progress,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Level $levelGlobal',
                  style: const TextStyle(fontSize: 14),
                ),
              ],
            )
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              calculateLevelGlobal(TaskInherited.of(context)!.taskList);
            },
            icon: const Icon(Icons.autorenew_sharp),
          )
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.only(
          top: 8,
          bottom: 70,
        ),
        children: TaskInherited.of(context)!.taskList,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (contextNew) => FormScreen(
                  taskContext: context,
                ),
              ));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
