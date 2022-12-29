import 'package:abduarrahman_todolist/application/todo_list_provider.dart';
import 'package:abduarrahman_todolist/domain/const/string_constant.dart';
import 'package:abduarrahman_todolist/presentation/widgets/todo_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Created by abduarrahman on 29,December,2022

class ToDoList extends StatefulWidget {
  const ToDoList({Key? key}) : super(key: key);
  static String routeName = '/';

  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<ToDoList> {
  final TextEditingController _textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var todoListProvider = Provider.of<TodoProvider>(context);
    var list = todoListProvider.items;
    return Scaffold(
      appBar: AppBar(
        title: const Text(StringConstant.todoList),
      ),
        body:  ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: list.length,
            itemBuilder: (BuildContext context, int index) {
              return TodoItem(
                todo: list[index],
              );
            }
        ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => _displayDialog(todoListProvider),
          tooltip: StringConstant.addItem,
          child: const Icon(Icons.add)),
    );
  }

  Future<void> _displayDialog(TodoProvider todoListProvider) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(StringConstant.addTodo),
          content: TextField(
            controller: _textFieldController,
            decoration: const InputDecoration(hintText: StringConstant.typeYourTodo),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(StringConstant.add),
              onPressed: () {
                Navigator.of(context).pop();
                todoListProvider.add(_textFieldController.text);
                _textFieldController.clear();
              },
            ),
          ],
        );
      },
    );
  }
}