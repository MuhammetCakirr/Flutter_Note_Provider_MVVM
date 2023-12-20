
import 'package:deneme/model/not_model.dart';
import 'package:flutter/material.dart';

class NoteProvider with ChangeNotifier {
  List<Note> _notes = [];

  List<Note> get notes => _notes;

  void addNote(Note note) {
    _notes.add(note);
    notifyListeners();
  }

  void deleteNote(int index) {
    _notes.removeAt(index);
    notifyListeners();
  }

  void toggleNoteCompletion(int index) {
    _notes[index].isCompleted = !_notes[index].isCompleted;
    notifyListeners();
  }
}