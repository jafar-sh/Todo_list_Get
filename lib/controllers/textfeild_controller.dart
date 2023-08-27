import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextFeildController extends GetxController {
  TextEditingController? taskTile;
  TextEditingController? taskSubTile;

  @override
  void onInit() {
    taskTile = TextEditingController();
    taskSubTile = TextEditingController();
    super.onInit();
  }
}
