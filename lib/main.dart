import 'package:chat_app/widget/items.dart';
import 'package:flutter/material.dart';
import 'widget/drawer.dart';

void main() {
  runApp(App());
}

class App extends StatefulWidget {
  static void callTodo(key) {
    print(key);
  }

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

  static var todoItemArray = <Widget>[];
  String todoName = "";

  var toDoItems = <String, dynamic>{
    'Today': [],
    'Shop': [],
  };

  var _inputText = "";

  void add() {
    if (arr.isEmpty) {
      count = 0;
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
    setState(() {
      arr.removeAt(indx);
    });
  }

  void addTodoItem() {
    if (todoName.isNotEmpty) {
      var nme = todoName;
      setState(() {
        toDoItems.putIfAbsent(todoName, () => []);
        todoItemArray.add(
          RaisedButton(
            onPressed: () {},
            child: Text(todoName),
          ),
        );
      });
    }
  }

  void DrawerOnOf() {
    setState(() {
      drawerOn = false;
    });
  }

  Widget build(BuildContext context) {
    return (MaterialApp(
      theme: ThemeData(primarySwatch: Colors.green),
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text("To do")),
        ),
        body: ListView.builder(
          itemCount: toDoItems[currentTodo].length,
          itemBuilder: (BuildContext ctx, int i) {
            return Table(
              children: [
                TableRow(
                  children: [
                    Checkbox(
                      value: true,
                      onChanged: null,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Text(
                        toDoItems[currentTodo][i].itemName,
                        style: TextStyle(
                            fontSize: 20,
                            decoration:
                                true ? TextDecoration.lineThrough : null),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 5),
                      child: FloatingActionButton(
                        child: Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                        onPressed: null,
                        backgroundColor: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
              columnWidths: const <int, TableColumnWidth>{
                0: FlexColumnWidth(0.1),
                1: FlexColumnWidth(0.6),
                2: FlexColumnWidth(0.3),
              },
            );
          },
        ),
        drawer: Column(children: [
          RaisedButton(
              onPressed: () {
                setState(() {
                  currentTodo = "Today";
                });
              },
              child: Text("Item1")),
          RaisedButton(
              onPressed: () {
                setState(() {
                  currentTodo = "Shop";
                });
              },
              child: Text("Item2")),
        ]),
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
