import 'package:flutter/material.dart';
import 'package:todoey_flutter/Models/task.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/main.dart';

class AddTaskScreen extends StatelessWidget {
  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
        height: 500,
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Add Task",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30, color: Colors.lightBlueAccent),
              ),
              TextField(
                controller: myController,
                autofocus: true,
                cursorHeight: 20,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                  ),
                ),
              ),
              Container(
                color: Colors.lightBlueAccent,
                child: TextButton(
                  onPressed: () {
                    Task newTask = Task(name: myController.text);
                    Provider.of<TaskData>(context, listen: false)
                        .addTask(newTask);
                    Navigator.pop(context);
                  },
                  child: Text(
                    "ADD",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
