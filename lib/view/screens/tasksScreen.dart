import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crudfirebase/controller/taskController.dart';
import 'package:crudfirebase/model/taskModel.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class TaskScreen extends StatelessWidget {
  TaskScreen({super.key});
  final controller = Get.put(TaskController());
  @override
  Widget build(BuildContext context) {
    final c_task = Get.put(TaskController());
    TextEditingController controller2 = TextEditingController();
    TextEditingController controller3 = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text("Hi"),
      ),
      body: StreamBuilder(
        stream: controller.getData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            controller.list1 = snapshot.data!.docs
                .map(
                  (e) => Task(
                    task: e["task"],
                    task2: e["task2"],
                    // date: e["crated at"],
                  ),
                )
                .toList();
            print(controller.list1);
          }
          return ListView.builder(
              itemCount: controller.list1.length,
              itemBuilder: ((context, index) {
                return Card(
                  child: Row(children: [
                    Text("task is :${controller.list1[index].task}"),
                    SizedBox(
                      width: 3,
                    ),
                    Text("task2 : ${controller.list1[index].task2}"),
                    SizedBox(
                      width: 3,
                    ),
                    IconButton(
                      onPressed: () async {
                        controller.deleteDate(snapshot.data!.docs[index].id);
                      },
                      icon: Icon(
                        Icons.delete_forever_rounded,
                      ),
                    ),
                    IconButton(
                      onPressed: () async {
                        // controller.deleteDate(snapshot.data!.docs[index].id);
                        Get.bottomSheet(Column(
                          children: [
                            TextField(
                              controller: controller2,
                            ),
                            TextField(
                              controller: controller3,
                            ),
                            TextButton(
                                onPressed: () async {
                                  final idUpdate =
                                      snapshot.data!.docs[index].id;
                                  final updatedValue = controller2.text;
                                  final updatedValue3 = controller3.text;
                                  final dateNow = DateTime.now();
                                  c_task.updateFiles(updatedValue,
                                      updatedValue3, dateNow, idUpdate);
                                },
                                child: Text('update'))
                          ],
                        ));
                      },
                      icon: Icon(
                        Icons.edit,
                      ),
                    ),
                  ]),
                );
              }));
        },
      ),
    );
  }
}
