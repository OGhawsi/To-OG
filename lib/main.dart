import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
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
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  List<ToDo> allToDos = [
    ToDo(checked: true, todoItem: 'Go to gym'),
    ToDo(checked: false, todoItem: 'Go to office'),
    ToDo(checked: true, todoItem: 'Go to home'),
  ];

  @override
  notifyListeners();
}

class ToDo {
  bool checked;
  String todoItem;
  ToDo({required this.checked, required this.todoItem});
  bool get getChecked {
    return checked;
  }

  String get getToDoItem {
    return todoItem;
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
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: AllSections(),
      ),
    );
  }
}

class AllSections extends StatelessWidget {
  const AllSections({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AddNewItem(),
        Expanded(child: ToDos()),
      ],
    );
  }
}

class AddNewItem extends StatelessWidget {
  const AddNewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(),
        SizedBox(
          height: 10,
        ),
        ElevatedButton(
          onPressed: () => (),
          child: Text('Add ToDo!'),
        )
      ],
    );
  }
}

class ToDos extends StatelessWidget {
  const ToDos({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    return ListView.builder(
      itemCount: appState.allToDos.length,
      itemBuilder: (context, index) {
        final singlTodo = appState.allToDos[index];
        return Row(
          children: [
            Checkbox(
              value: singlTodo.getChecked,
              onChanged: null,
            ),
            Text(singlTodo.getToDoItem),
          ],
        );
      },
    );
  }
}
