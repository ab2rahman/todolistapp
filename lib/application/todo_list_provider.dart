import 'package:abduarrahman_todolist/domain/todo.dart';
import 'package:flutter/material.dart';

/// Created by abduarrahman on 29,December,2022

class TodoProvider extends ChangeNotifier {
  final List<Todo> _todoList = [];

  List<Todo> get items => _todoList;

  void add(String name) {
    _todoList.add(Todo(name: name, checked: false, index: _todoList.length));
    notifyListeners();
  }

  changeStateChecked(int index) {
    _todoList[index].checked = !_todoList[index].checked;
    notifyListeners();
  }
}