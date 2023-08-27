import 'package:get/get.dart';
import 'package:todo_list_get/controllers/task_controller.dart';
import 'package:todo_list_get/controllers/textfeild_controller.dart';

class MyBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TaskController());
   Get.put( TextFeildController());
  }
}
