import 'package:flutter/material.dart';
import 'package:nosso_primeiro_projeto/components/taks.dart';

class TaskInherited extends InheritedWidget {
 TaskInherited({super.key, required this.child}) : super(child: child);

  @override
  // ignore: overridden_fields
  final Widget child;

  
  final List<Task> taskList = [
     Task('Aprender Flutter', 'assets/images/mascote.png', 3),
     Task('Andar de Bike', 'assets/images/bike.jpg', 2),
     Task('Meditar', 'assets/images/meditacao.jpg', 5),
     Task('Ler', 'assets/images/livro.jpg', 4),
     Task('Jogar', 'assets/images/kako.jpg', 1),
  ];

 
  void newTask(String name, String photo, int difficulty) {
    taskList.add(Task(name, photo, difficulty));
  }

  static TaskInherited? of(BuildContext context) {
    final TaskInherited? result =
        context.dependOnInheritedWidgetOfExactType<TaskInherited>();
    return result!;
  }

  @override
  bool updateShouldNotify(TaskInherited oldWidget) {
    return oldWidget.taskList.length != taskList.length;
  }
}
