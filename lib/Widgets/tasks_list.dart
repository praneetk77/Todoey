import 'package:flutter/material.dart';
import 'package:todoey_flutter/Widgets/task_tile.dart';
import 'package:todoey_flutter/Models/task.dart';

class TasksList extends StatefulWidget {
  final List<Task> tasks;
  final Function checkBoxCallback;

  TasksList({this.tasks, this.checkBoxCallback});

  @override
  _TasksListState createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return TaskTile(
            taskTitle: widget.tasks[index].name,
            isChecked: widget.tasks[index].isDone,
            checkBoxCallback: (newValue) {
              widget.checkBoxCallback(newValue, index);
            });
      },
      itemCount: widget.tasks.length,
    );
  }
}
