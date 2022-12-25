import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class TaskController extends GetxController {
  List list = [].obs;

  addTask(value) {
    list.add(value); //take controller and added in the list .
  }
}
