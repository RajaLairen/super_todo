import 'dart:ffi';

import 'package:chat_app/main.dart';
import 'package:flutter/material.dart';

class SideDrawer extends StatelessWidget {
  SideDrawer({item, drawerOnOf}) {
    cons(item);
    this.drawerOnOf = drawerOnOf;
  }

  var drawerOnOf;

  static var todoItemArray = <Widget>[];
  static void cons(item) {
    todoItemArray = item;
  }


  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: SideDrawer.todoItemArray.length,
      itemBuilder: (BuildContext ctx, int i) {
        return SideDrawer.todoItemArray[i];
      },
    );
  }
}
