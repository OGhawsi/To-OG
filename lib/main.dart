import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,

        // Define the default brightness and colors.
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.orange,
          // ···
          brightness: Brightness.light,
        ),

        // Define the default `TextTheme`. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        textTheme: TextTheme(
          displayLarge: const TextStyle(
            fontSize: 72,
            fontWeight: FontWeight.bold,
          ),
          // ···
          titleLarge: TextStyle(
            fontSize: 30,
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TO DO APP'),
      ),
      backgroundColor: Colors.grey.shade100,
      body: ToDos(),
    );
  }
}

class ToDos extends StatelessWidget {
  const ToDos({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ToDo(
          checked: true,
          todoItem: 'Go to gym',
        ),
        ToDo(
          checked: false,
          todoItem: 'Go to work',
        ),
        ToDo(
          checked: true,
          todoItem: 'Go to office',
        ),
        ToDo(
          checked: false,
          todoItem: 'Go to market',
        ),
        ToDo(
          checked: true,
          todoItem: 'Go to home',
        ),
      ],
    );
  }
}

// ignore: must_be_immutable
class ToDo extends StatelessWidget {
  ToDo({super.key, required this.checked, required this.todoItem});

  bool checked;
  String todoItem;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(value: checked, onChanged: null),
        Text(todoItem),
      ],
    );
  }
}
