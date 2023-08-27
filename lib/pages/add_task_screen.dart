import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list_get/controllers/task_controller.dart';
import 'package:todo_list_get/controllers/textfeild_controller.dart';
import 'package:todo_list_get/main.dart';
import 'package:todo_list_get/models/task_model.dart';
import 'package:todo_list_get/routes/constant.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MyApp.changeColor(Color(0xfff5f5f5), Brightness.light);
    return Scaffold(
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MycustonAppBar(),
          TitleAddWidget(),
          TaskTextField(),
          NoteWidgets(),
          MyButtonTask(),
        ],
      )),
    );
  }
}

class MyButtonTask extends StatelessWidget {
  const MyButtonTask({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0),
      width: Get.width,
      height: 40,
      child: ElevatedButton(
        onPressed: () {
          if (Get.find<TaskController>().isEditting) {
            var task = Get.find<TaskController>()
                .tasks[Get.find<TaskController>().index];
            task.taskTile = Get.find<TextFeildController>().taskTile!.text;
            task.taskSubtitle =
                Get.find<TextFeildController>().taskSubTile!.text;
            //
            Get.find<TaskController>().tasks[Get.find<TaskController>().index] =
                task;
          } else {
            Get.find<TaskController>().tasks.add(TaskModel(
                  taskTile: Get.find<TextFeildController>().taskTile!.text,
                  taskSubtitle:
                      Get.find<TextFeildController>().taskSubTile!.text,
                  status: false,
                ));
          }
          Get.back();
        },
        style:
            TextButton.styleFrom(elevation: 0.0, backgroundColor: kBlueColor),
        child: Text(Get.find<TaskController>().isEditting ? 'Edit' : 'Add'),
      ),
    );
  }
}

class NoteWidgets extends StatelessWidget {
  const NoteWidgets({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
      child: TextField(
        controller: Get.find<TextFeildController>().taskSubTile,
        maxLength: 30,
        cursorColor: kBlueColor,
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.bookmark_border,
              color: Colors.black,
            ),
            border: InputBorder.none,
            counter: Container(),
            hintText: 'Add Note...'),
      ),
    );
  }
}

class TaskTextField extends StatelessWidget {
  const TaskTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: Get.find<TextFeildController>().taskTile,
      maxLines: 6,
      cursorColor: kBlueColor,
      cursorHeight: 40,
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade300)),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade300)),
      ),
    );
  }
}

class TitleAddWidget extends StatelessWidget {
  const TitleAddWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 20.0, top: 10.0),
        child: Text('What are Yot Want to Write To List?'));
  }
}

class MycustonAppBar extends StatelessWidget {
  const MycustonAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(left: 45.0),
            child: Text(
              Get.find<TaskController>().isEditting ? 'Edit Task' : 'New Task',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18.0),
            ),
          ),
        ),
        Hero(
          tag: 'hero',
          child: Material(
            child: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(Icons.close)),
          ),
        )
      ],
    );
  }
}
