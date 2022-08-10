import 'package:chat_app/widget/items.dart';
import 'package:flutter/material.dart';
import 'widget/drawer.dart';

void main() {
  runApp(App());
}

class App extends StatefulWidget {
  static void callTodo(key) {}

  const App({Key? key, this.callAdd}) : super(key: key);
  final callAdd;

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  var drawerOn = false;
  int count = 0;
  var currentTodo = "Today";
  var arr = [];

  //set the current todo Item
  void callTodo(item) {
    setState(() {
      currentTodo = item;
    });
  }

  //List to track todoItems
  static var todoItemArray = <Widget>[];
  String todoName = "";

  final toDoItems = <String, dynamic>{"Today": []
  };

  var _inputText = "";

  //Add a particulator todo list item to a particular todoItem
  void add() {
    if (todoItemArray.length == 0) {
      todoItemArray.add(
        RaisedButton(
          onPressed: () {
            callTodo("Today");
          },
          child: Text("Today"),
        ),
      );
    }

    setState(() {
      if (!_inputText.isEmpty) {
        toDoItems[currentTodo].add(Item(
          itemName: _inputText,
          indx: count++,
          click: delete,
        ));
      }
    });
  }

  void delete(indx) {
    print(indx);
  }

  //Add to toItem
  void addTodoItem() {
    if (todoName.isNotEmpty) {
      var nme = todoName;
      setState(() {
        toDoItems.putIfAbsent(todoName, () => []);
        todoItemArray.add(
          RaisedButton(
            onPressed: () {
              callTodo(nme);
            },
            child: Text(todoName),
          ),
        );
      });
    }
  }

  // void DrawerOnOf() {
  //   setState(() {
  //     drawerOn = false;
  //   });
  // }

  Widget build(BuildContext context) {
    return (MaterialApp(
      theme: ThemeData(primarySwatch: Colors.green),
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text("To do")),
        ),
        body: currentTodo.length > 0
            ? ListView.builder(
                itemCount: toDoItems[currentTodo].length,
                itemBuilder: (BuildContext ctx, int i) {
                  return toDoItems[currentTodo][i];
                },
              )
            : null,
        drawer: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SideDrawer(item: todoItemArray),
            ),
            TextField(
              onChanged: (value) => todoName = value,
              decoration: InputDecoration(
                  labelText: "Add Items",
                  labelStyle: TextStyle(color: Colors.orange, fontSize: 40)),
              style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            FloatingActionButton(
              onPressed: addTodoItem,
              child: Icon(Icons.add),
            ),
          ],
        ),
        floatingActionButton: Container(
          margin: const EdgeInsets.all(30),
          child: TextField(
            onChanged: (String value) => _inputText = value,
            decoration:
                InputDecoration(hintText: "Add Item", fillColor: Colors.blue),
          ),
        ),
        bottomNavigationBar: !drawerOn
            ? Container(
                margin: EdgeInsets.only(bottom: 10),
                child: FloatingActionButton(
                  onPressed: add,
                  child: Icon(Icons.add),
                ),
              )
            : null,
      ),
    ));
  }
}
