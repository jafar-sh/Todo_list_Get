import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:todo_list_get/pages/add_task_screen.dart';
import 'package:todo_list_get/pages/home_screen.dart';

class Routes {
  static List<GetPage> get pages => [
    GetPage(name: '/homescreen', page: ()=>const HomeScreen()),
    GetPage(name: '/addscreen', page: ()=>const AddTaskScreen()),
  ];
  
}
