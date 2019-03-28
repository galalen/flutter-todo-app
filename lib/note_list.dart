import 'package:flutter/material.dart';
import 'add_note.dart';
import 'db_helper.dart';
import 'note.dart';

class NoteList extends StatefulWidget {
  @override
  _NoteListState createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  Future<List<Note>> _getData() async {
    final result = await DBHelper.db.getNotes();
//    print("LEN: ${result.length}");

    return result;
//    for (var note in result) {
//      print("TITLE: ${note.title} ID: ${note.id}");
//    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TODO://"),
      ),
      body: FutureBuilder<List<Note>>(
        future:  DBHelper.db.getNotes(),
        builder: (BuildContext context,AsyncSnapshot<List<Note>> snapshot) {
         if (snapshot.hasData) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                final Note note = snapshot.data[index];
                return Dismissible(
//                  secondaryBackground: Icon(Icons.delete),
                  key: UniqueKey(),
                  direction: DismissDirection.endToStart,
                  background: Container(color: Colors.red),
                  onDismissed: (direction) {
                    setState(() {
//                    items.removeAt(index);
                    });

                    // Show a snackbar! This snackbar could also contain "Undo" actions.
                    Scaffold
                        .of(context)
                        .showSnackBar(SnackBar(content: Text("${note.id} dismissed")));

                  },
                  child: ListTile(
                    title: Text(note.content),
                  ),
                );
              },
            ),
          );
         } else {
           return Center(child: CircularProgressIndicator());
         }
        },
      ),
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
