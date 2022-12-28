import 'package:cloud_firestore/cloud_firestore.dart';

class Task {
  final String task;
  final String task2;
  Timestamp? date;
  String? docid;

  Task(
      {required this.task,
      required this.task2,
      this.date, //date => without required
      this.docid});

  Map<String, dynamic> toJson() => {
        // convert to json
        'task': task,
        'task2': task2,
        'crated at': Timestamp.now(),
        "id": docid,
        "last update": Timestamp.now(),
      };

  static Task fromJson(Map<String, dynamic> json) => Task(
        task: json['task'],
        task2: json['task2'],
      );
}
