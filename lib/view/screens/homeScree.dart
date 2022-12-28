import 'package:crudfirebase/controller/taskController.dart';
import 'package:crudfirebase/view/screens/tasksScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final c_creatTask = Get.put(TaskController());
    TextEditingController taskController2 = TextEditingController();
    TextEditingController taskController1 = TextEditingController();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  Get.to(TaskScreen());
                },
                icon: const Icon(Icons.move_to_inbox))
          ],
        ),
        body: Column(children: [
          TextField(
            controller: taskController1, //task
            style: const TextStyle(backgroundColor: Colors.white),
          ),
          TextField(
            controller: taskController2, //task1
            style: const TextStyle(backgroundColor: Colors.white),
          ),
          TextButton(
            onPressed: () {
              final valueController1 = taskController1.text;
              final valueController2 = taskController2.text;
              // CreateTask(t1: valueController, t2: valueController1);
              c_creatTask.CreateTask(
                  t1: valueController1, t2: valueController2);
            },
            child: const Text(
              'submitData',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ]),
      ),
    );
  }
}
