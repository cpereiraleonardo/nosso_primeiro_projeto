import 'package:flutter/material.dart';
import 'package:nosso_primeiro_projeto/data/task_inherited.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key, required this.taskContext});

  final BuildContext taskContext;

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController difficultyController = TextEditingController();
  TextEditingController imageController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool valueValidator(String? value) {
    if (value != null && value.isEmpty) {
      return true;
    }
    return false;
  }

  bool difficultyValidator(String? value) {
    if (value!.isEmpty || int.parse(value) > 5 || int.parse(value) < 1) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Nova Tarefa'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: SingleChildScrollView(
              child: Container(
                height: 650,
                width: 365,
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 3),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        validator: (String? value) {
                          if (valueValidator(value)) {
                            return 'Insira o valor da dificuldade da tarefa!';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.text,
                        controller: nameController,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          fillColor: Colors.white70,
                          filled: true,
                          hintText: 'Nome da Tarefa',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(3)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        validator: (value) {
                          if (difficultyValidator(value)) {
                            return 'Insira o valor da dificuldade da tarefa!';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.number,
                        controller: difficultyController,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          fillColor: Colors.white70,
                          filled: true,
                          hintText: 'Dificuldade',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(3)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        keyboardType: TextInputType.url,
                        onChanged: (text) {
                          setState(() {});
                        },
                        validator: (value) {
                          if (valueValidator(value)) {
                            return 'Insira uma url de imagem!';
                          }
                          return null;
                        },
                        controller: imageController,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          fillColor: Colors.white70,
                          filled: true,
                          hintText: 'Imagem',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(3)),
                        ),
                      ),
                    ),
                    Container(
                      height: 100,
                      width: 72,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          width: 2,
                          color: Colors.blue,
                        ),
                      ),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            imageController.text,
                            errorBuilder: (BuildContext context,
                                Object exception, StackTrace? stackTrace) {
                              return Image.asset(
                                'assets/images/noimage.png',
                              );
                            },
                            fit: BoxFit.cover,
                            scale: 1,
                            filterQuality: FilterQuality.low,
                          )),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          TaskInherited.of(widget.taskContext)!.newTask(
                              nameController.text,
                              imageController.text,
                              int.parse(difficultyController.text));
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Criando nova tarefa'),
                            ),
                          );
                          Navigator.pop(context);
                        }
                      },
                      child: const Text('Adicionar!'),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
