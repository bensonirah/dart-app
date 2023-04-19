import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class Todo {
  int id;
  String title;
  bool completed;

  Todo({
    required this.id,
    required this.title,
    required this.completed,
  });

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      id: json['id'] as int,
      title: json['title'] as String,
      completed: json['completed'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'completed': completed,
    };
  }
}

class TodoApiClient {
  final String baseUrl;

  TodoApiClient({required this.baseUrl});
// the object
  Future<List<Todo>> getTodos() async {
    final response = await http.get(Uri.parse('$baseUrl/todos'));
    final body = jsonDecode(response.body) as List<dynamic>;
    final todos = body
        .map((item) => Todo.fromJson(item as Map<String, dynamic>))
        .toList();
    return todos;
  }

  Future<Todo> getTodoById(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/todos/$id'));
    final body = jsonDecode(response.body) as Map<String, dynamic>;
    final todo = Todo.fromJson(body);
    return todo;
  }

  Future<Todo> createTodo(Todo todo) async {
    final response = await http.post(
      Uri.parse('$baseUrl/todos'),
      headers: {HttpHeaders.contentTypeHeader: 'application/json'},
      body: jsonEncode(todo.toJson()),
    );
    final body = jsonDecode(response.body) as Map<String, dynamic>;
    final createdTodo = Todo.fromJson(body);
    return createdTodo;
  }

  Future<Todo> updateTodoById(int id, Todo todo) async {
    final response = await http.put(
      Uri.parse('$baseUrl/todos/$id'),
      headers: {HttpHeaders.contentTypeHeader: 'application/json'},
      body: jsonEncode(todo.toJson()),
    );
    final body = jsonDecode(response.body) as Map<String, dynamic>;
    final updatedTodo = Todo.fromJson(body);
    return updatedTodo;
  }

  Future<void> deleteTodoById(int id) async {
    await http.delete(Uri.parse('$baseUrl/todos/$id'));
  }
}

void main() async {
  final todoApiClient = TodoApiClient(baseUrl: 'http://localhost:8080');

  final todos = await todoApiClient.getTodos();
  print('All Todos:');
  todos.forEach(
      (todo) => print('${todo.id}: ${todo.title} - ${todo.completed}'));

  final todo = await todoApiClient.getTodoById(1);
  print('Todo with ID 1: ${todo.id}: ${todo.title} - ${todo.completed}');

  final newTodo = Todo(
    id: 0,
    title: 'New Todo',
    completed: false,
  );
  final createdTodo = await todoApiClient.createTodo(newTodo);
  print(
      'Created Todo: ${createdTodo.id}: ${createdTodo.title} - ${createdTodo.completed}');

  final updatedTodo = Todo(
    id: 1,
    title: 'Updated Todo',
    completed: true,
  );
  final result = await todoApiClient.updateTodoById(1, updatedTodo);
  print('Updated Todo: ${result.id}: ${result.title} - ${result.completed}');

  await todoApiClient.deleteTodoById(1);
  print('Deleted Todo with ID 1');
}
