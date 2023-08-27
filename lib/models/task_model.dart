class TaskModel {
  String? taskTile;
  String? taskSubtitle;
  bool? status;

  TaskModel(
      {required this.taskTile,
      required this.taskSubtitle,
      required this.status});

  Map<String, dynamic> toJson() {
    return {
      'tasktitle': taskTile,
      'tasksubtitle': taskSubtitle,
      'status': status,
    };
  }

  TaskModel.fromJson(Map<String, dynamic> json)
      : taskTile = json['tasktitle'],
        taskSubtitle = json['tasksubtitle'],
        status = json['status'];
}
