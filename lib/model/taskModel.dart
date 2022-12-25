import 'package:cloud_firestore/cloud_firestore.dart';

class Task {
  final String task;
  final String task2;
  Timestamp? date;

  Task(
      {required this.task,
      required this.task2,
      this.date}); //date => without required

  Map<String, dynamic> toJson() => {
        // convert to json
        'task': task,
        'task1': task2,
        'crated at': Timestamp.now(),
      };
}
