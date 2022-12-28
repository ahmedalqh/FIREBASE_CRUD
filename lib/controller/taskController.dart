import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../model/taskModel.dart';

class TaskController extends GetxController {
  List list = [].obs;
  List list1 = [].obs;
  final getData = FirebaseFirestore.instance.collection("Tasks").snapshots();
  addTask(value) {
    list.add(value); //take controller and added in the list .
  }

  deleteDate(deletTasks) async {
    await FirebaseFirestore.instance
        .collection("Tasks")
        .doc(deletTasks)
        .delete();
  }

  updateFiles(text1, tex2, date, id) {
    final UpdatedFirebase =
        FirebaseFirestore.instance.collection('Tasks').doc(id);
    UpdatedFirebase.update({'task': text1, 'task2': tex2, 'last update': date});
  }

  Future CreateTask({required t1, required t2, date}) async {
    final docTask = FirebaseFirestore.instance.collection('Tasks').doc();

    // final json = {. //.   old method .
    //   'task': Task,
    // };

    //----------------------------------------------------------------

    //  new method.

    final task1 = Task(task: t1, task2: t2, docid: docTask.id);

    final json = task1.toJson();
    await docTask.set(json);
  }
}
