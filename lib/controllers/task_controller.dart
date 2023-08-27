import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todo_list_get/models/task_model.dart';

class TaskController extends GetxController {
  bool isEditting = false;
  int index = 0;
  RxList<TaskModel> tasks = <TaskModel>[].obs;

  @override
  void onInit() {
    var box = GetStorage();
    if (box.read('tasks') != null) {
      var list = box.read('tasks');
      for (var item in list) {
        tasks.add(TaskModel.fromJson(item));
      }
    }

    ever(tasks, (value) {
      return box.write('tasks', tasks.toJson());
    });
    super.onInit();
  }
}
