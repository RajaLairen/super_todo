import 'dart:ffi';

import 'package:flutter/material.dart';

class Item extends StatefulWidget {
  var itemName = "";
  var index;
  var clk;

  Item({itemName, indx, click}) {
    this.itemName = itemName;
    this.index = indx;
    this.clk = click;
  }

  @override
  State<Item> createState() =>
      _ItemState(item: itemName, indx: index, clicK: clk);
}

class _ItemState extends State<Item> {
  var item;
  var indx;
  var clickk;
  _ItemState({Key? key, item, indx, clicK}) {
    this.item = item;
    this.indx = indx;
    this.clickk = clicK;
  }

  void delete() {
    print(indx);
    clickk(indx);
  }

  var tick = false;
  
  Widget build(BuildContext context) {
    void check(bool) {
      setState(() {
        print(bool);
        tick = !tick;
      });
    }

    return Table(
      children: [
        TableRow(
          children: [
            Checkbox(
              value: tick,
              onChanged: check,
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Text(
                item,
                style: TextStyle(
                    fontSize: 20,
                    decoration: tick ? TextDecoration.lineThrough : null),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5),
              child: FloatingActionButton(
                child: Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
                onPressed: delete,
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
  }
}
