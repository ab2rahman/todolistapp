


import 'package:abduarrahman_todolist/application/todo_list_provider.dart';
import 'package:abduarrahman_todolist/domain/const/string_constant.dart';
import 'package:abduarrahman_todolist/presentation/todo_list_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Created by abduarrahman on 29,December,2022

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TodoProvider>(
      create: (context) => TodoProvider(),
      child: MaterialApp(
        title: StringConstant.todoList,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routes: {
          ToDoList.routeName: (context) => const ToDoList(),
        },
        initialRoute: ToDoList.routeName,
      ),
    );
  }
}
