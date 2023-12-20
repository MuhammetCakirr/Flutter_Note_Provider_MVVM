
import 'package:deneme/feature/NotAdd/view/not_add_view.dart';
import 'package:deneme/feature/NotList/ViewModel/not_list_viewmodel.dart';



import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class NoteListScreen extends StatelessWidget {
  const NoteListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var noteProvider = Provider.of<NoteProvider>(context);

    return ChangeNotifierProvider.value(
      value: noteProvider,
      child: Scaffold(
        appBar: AppBarMethod(noteProvider),
        body: NotListViewMethod(noteProvider),
        floatingActionButton: FloatingButtonMethod(context),
      ),
    );
  }

  AppBar AppBarMethod(NoteProvider noteProvider) {
    return AppBar(
        title:const Text('Notlar'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Toplam Not Sayısı: ${noteProvider.notes.length.toString()}"),
          )
        ],
      );
  }

  FloatingActionButton FloatingButtonMethod(BuildContext context) {
    return FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddNoteScreen(),
            ),
          );
        },
        child:const Icon(Icons.add),
      );
  }

  ListView NotListViewMethod(NoteProvider noteProvider) {
    return ListView.builder(
        itemCount: noteProvider.notes.length,
        itemBuilder: (context, index) {
          var note = noteProvider.notes[index];
          return ListTile(
            title: Text(note.title),
            subtitle: Text(note.content),
            trailing: Checkbox(
              value: note.isCompleted,
              onChanged: (value) {
                noteProvider.toggleNoteCompletion(index);
              },
            ),
            onLongPress: () {
              noteProvider.deleteNote(index);
            },
          );
        },
      );
  }
}
