import 'package:abduarrahman_todolist/application/todo_list_provider.dart';
import 'package:abduarrahman_todolist/domain/todo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Created by abduarrahman on 29,December,2022

class TodoItem extends StatelessWidget {
  TodoItem({
    required this.todo,
  }) : super(key: ObjectKey(todo));


  final Todo todo;

  TextStyle? _getTextStyle(bool checked) {
    if (!checked) return null;

    return const TextStyle(
      color: Colors.black54,
      decoration: TextDecoration.lineThrough,
    );
  }

  @override
  Widget build(BuildContext context) {
    var todoListProvider = Provider.of<TodoProvider>(context);
    return ListTile(
      onTap: () {
        todoListProvider.changeStateChecked(todo.index);
      },
      leading: CircleAvatar(
        child: Text(todo.name[0]),
      ),
      title: Text(todo.name, style: _getTextStyle(todo.checked)),
    );
  }
}
