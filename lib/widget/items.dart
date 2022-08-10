import 'package:flutter/material.dart';

class Item extends StatefulWidget {

  const Item({Key? key, this.itemName, this.indx, this.click})
      : super(key: key);

  final itemName;
  final indx;
  final click;

  @override
  State<Item> createState() => _ItemState();
}

class _ItemState extends State<Item> {

  void delete() {
    widget.click(widget.indx);
  }

  var tick = false;

  Widget build(BuildContext context) {
    void check(bool) {
      setState(() {
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
                widget.itemName,
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
