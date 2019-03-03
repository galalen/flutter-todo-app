import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddNote extends StatefulWidget {
  @override
  _AddNoteState createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {

  var now = "";
  @override
  void initState() {
    super.initState();
    var current = DateTime.now();
    var formatter = new DateFormat('MMMM d, y');
    now = formatter.format(current);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TODO://"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              child: Text(now, style: TextStyle(color: Colors.grey, fontSize: 12.0),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                maxLines: null,
                keyboardType: TextInputType.multiline,
                decoration: new InputDecoration.collapsed(
                  hintText: 'Speak your mind',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//TextField(
//maxLines: null,
//keyboardType: TextInputType.multiline,
//),