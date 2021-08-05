import 'package:flutter/material.dart';
import 'package:todoey_flutter/Widgets/task_tile.dart';
import 'package:todoey_flutter/Models/task.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/Screens/tasks_screen.dart';
import 'package:todoey_flutter/main.dart';

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
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final currentTask = taskData.getTasks()[index];
            return TaskTile(
              taskTitle: currentTask.name,
              isChecked: currentTask.isDone,
              checkBoxCallback: (newValue) {
                taskData.updateTask(currentTask);
              },
            );
          },
          itemCount: taskData.getTaskCount(),
        );
      },
    );
  }
}
