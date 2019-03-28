import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'note.dart';


class DBHelper {

  DBHelper._();

  static final DBHelper db = DBHelper._();

  static Database _database;

  Future<Database> get database async {

    if (_database == null) {
      _database = await initDB();
    }

    return _database;

  }

  initDB() async {

    var databasePath = await getDatabasesPath();
    String path = join(databasePath, 'demo.db');

    return await openDatabase(path, version: 1, onOpen: (db) {
    }, onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE note ("
          "id INTEGER AUTO INCREMENT PRIMARY KEY,"
          "content TEXT,"
          "title TEXT,"
          "timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP"
          ")");
    });
  }

  addNote(Note note) async {
    final db = await database;
    var lastId = await db.insert("note", note.toJson());
    return lastId;
  }


  Future<List<Note>> getNotes() async {
    var db = await database;
    var result = await db.query("note",orderBy: "id DESC");

    List<Note> list = result.isNotEmpty ? result.map((note) => Note.fromJson(note)).toList() : List<Note>() ;

    return list;
  }

}