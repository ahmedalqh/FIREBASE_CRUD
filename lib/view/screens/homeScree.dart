import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crudfirebase/controller/taskController.dart';
import 'package:crudfirebase/model/taskModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController taskController = TextEditingController();
    TextEditingController taskController1 = TextEditingController();
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [
        TextField(
          controller: taskController, //task
          style: TextStyle(backgroundColor: Colors.white),
        ),
        TextField(
          controller: taskController1, //task1
          style: TextStyle(backgroundColor: Colors.white),
        ),
        TextButton(
          onPressed: () {
            final valueController = taskController.text;
            final valueController1 = taskController1.text;
            CreateTask(t1: valueController, t2: valueController1);
          },
          child: Text(
            'submitData',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ]),
    );
  } //ad

  // what's snapshot ==> instance of document in firebase......

  Future CreateTask({required t1, required t2, date}) async {
    final docTask = FirebaseFirestore.instance.collection('Tasks').doc();

    // final json = {. //.   old method .
    //   'task': Task,
    // };

    //new method.

    final task1 = Task(
      task: t1,
      task2: t2,
    );

    final json = task1.toJson();
    await docTask.set(json);
  }
}
