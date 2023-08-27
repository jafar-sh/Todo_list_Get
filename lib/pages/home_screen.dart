import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list_get/controllers/task_controller.dart';
import 'package:todo_list_get/controllers/textfeild_controller.dart';
import 'package:todo_list_get/main.dart';
import 'package:todo_list_get/routes/constant.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      floatingActionButton: MyFloatingAction(),
      body: SafeArea(
          child: Stack(
        children: [TopSectionWidget(), BottomSectionWidget()],
      )),
    );
  }
}

class MyFloatingAction extends StatelessWidget {
  const MyFloatingAction({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    MyApp.changeColor(kBlueColor, Brightness.light);
    return FloatingActionButton(
      heroTag: 'hero',
      onPressed: () {
        Get.find<TaskController>().isEditting = false;
        Get.find<TextFeildController>().taskTile!.text = '';
        Get.find<TextFeildController>().taskSubTile!.text = '';
        Get.toNamed('/addscreen')!.then((value) {
          MyApp.changeColor(kBlueColor, Brightness.light);
        });
      },
      backgroundColor: kBlueColor,
      elevation: 0,
      child: const Icon(Icons.add),
    );
  }
}

class BottomSectionWidget extends StatelessWidget {
  const BottomSectionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25.0),
                topRight: Radius.circular(25.0))),
        width: Get.width,
        height: Get.height * 0.6,
        child: Container(
          margin: const EdgeInsets.only(left: 50, top: 20, right: 10),
          child: Obx(() => ListView.separated(
              itemBuilder: (context, index) {
                var task = Get.find<TaskController>().tasks[index];
                return ListTile(
                  onTap: () {
                    Get.find<TaskController>().isEditting = true;
                    Get.find<TaskController>().index = index;
                    Get.find<TextFeildController>().taskTile!.text =
                        task.taskTile!;
                    Get.find<TextFeildController>().taskSubTile!.text =
                        task.taskSubtitle!;
                    Get.toNamed('/addscreen');
                  },
                  onLongPress: () {
                    Get.find<TaskController>().tasks.removeAt(index);
                  },
                  title: Text(task.taskTile ?? ''),
                  subtitle: Text(task.taskSubtitle ?? ''),
                  trailing: Checkbox(
                    onChanged: (value) {
                      task.status = !task.status!;
                      Get.find<TaskController>().tasks[index] = task;
                    },
                    value: task.status,
                    activeColor: kBlueColor,
                    side: const BorderSide(color: Colors.black45, width: 1.5),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const Divider(
                  color: Colors.black,
                  height: 1,
                );
              },
              itemCount: Get.find<TaskController>().tasks.length)),
        ),
      ),
    );
  }
}

class TopSectionWidget extends StatelessWidget {
  const TopSectionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      color: kBlueColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.menu,
                      color: Colors.white,
                    ))
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 40, top: 20),
            child: const CircleAvatar(
              radius: 25,
              backgroundColor: Colors.white,
              child: Center(
                  child: Icon(
                Icons.bookmarks,
                color: kBlueColor,
              )),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 50, top: 20),
            child: const Text(
              'All',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 50, top: 5),
            child: Obx(() => Text(
                  '${Get.find<TaskController>().tasks.length} Tasks',
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                )),
          ),
        ],
      ),
    );
  }
}
