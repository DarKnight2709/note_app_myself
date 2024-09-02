import 'package:flutter/material.dart';

class Note {
  String id;
  String title;
  String content;

  Note({required this.id, required this.title, required this.content});
}

class NotesModel extends ChangeNotifier {
  final List<Note> _notes = [];

  int id = 1;

  List<Note> get notes => _notes;

  void addNote(String title, String content) {
    _notes.add(Note(id: (id++).toString(), title: title, content: content));
    notifyListeners();
  }

  void removeNote(String id) {
    _notes.removeWhere((note) => note.id == id);
    notifyListeners();
  }
}
