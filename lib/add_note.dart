import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'db_helper.dart';
import 'note.dart';

class AddNote extends StatefulWidget {
  @override
  _AddNoteState createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {

  TextEditingController textEditingController = TextEditingController();

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
            Container(
              height: 200,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  controller: textEditingController,
                  decoration: new InputDecoration.collapsed(
                    hintText: 'Speak your mind',
                  ),

                ),
              ),
            ),
          ],
        ),
      ),
      persistentFooterButtons: <Widget>[
        IconButton(icon: Icon(Icons.check), onPressed: __addNote,)
      ],
    );
  }

  __addNote() async {
    Note note = Note(
      title: "title",
      content: textEditingController.text
    );

    print("CONTENT: ${textEditingController.text}");

    final res = await DBHelper.db.addNote(note);
    if (int.parse("$res") > 0) {
      Navigator.pop(context);
    }
  }

}
