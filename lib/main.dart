import 'package:flutter/material.dart';
import 'package:todoey_flutter/Models/task.dart';
import 'package:todoey_flutter/Screens/tasks_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TaskData>(
      create: (context) => TaskData(),
      child: MaterialApp(
        home: TasksScreen(),
      ),
    );
  }
}

class TaskData extends ChangeNotifier{
  List<Task> tasks = [Task(name: "Buy eggs"), Task(name: "Buy oranges")];
}
