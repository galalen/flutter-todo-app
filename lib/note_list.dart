import 'package:flutter/material.dart';
import 'add_note.dart';

class NoteList extends StatefulWidget {
  @override
  _NoteListState createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TODO://"),
      ),
      body: Text(""),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add, color: Colors.black,),
        backgroundColor: Colors.white,
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddNote()));
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
