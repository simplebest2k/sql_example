import 'package:flutter/material.dart';
import 'package:sqflite/sqlite_api.dart';

import 'todo.dart';

class AddTodoApp extends StatefulWidget {
  final Future<Database> db;

  // ignore: use_key_in_widget_constructors
  const AddTodoApp(this.db);

  @override
  _AddTodoAppState createState() => _AddTodoAppState();
}

class _AddTodoAppState extends State<AddTodoApp> {
  TextEditingController? titleController;
  TextEditingController? contentController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo 추가'),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: [
              Padding(padding: EdgeInsets.all(10),
                child: TextField(
                  controller: titleController,
                  decoration: InputDecoration(labelText: '제목'),
                ),
              ),
              Padding(padding: EdgeInsets.all(10),
                child: TextField(
                  controller: contentController,
                  decoration: InputDecoration(labelText: '할일'),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    Todo todo = Todo(
                      title: titleController?.value.text,
                      content: contentController?.value.text,
                      active: 0
                    );

                    Navigator.of(context).pop(todo);
                  },
                  child: Text('저장하기'))
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    titleController = TextEditingController();
    contentController = TextEditingController();
  }
}
