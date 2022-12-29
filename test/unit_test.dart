import 'package:abduarrahman_todolist/application/todo_list_provider.dart';
import 'package:flutter_test/flutter_test.dart';

/// Created by abduarrahman on 29,December,2022

void main() {
  group('Testing App Provider', () {
    var todoListProvider = TodoProvider();

    test('A new item should be added', () {
      var text = 'this is a test';
      todoListProvider.add(text);
      expect(todoListProvider.items[0].name == text, true);
    });
  });
}