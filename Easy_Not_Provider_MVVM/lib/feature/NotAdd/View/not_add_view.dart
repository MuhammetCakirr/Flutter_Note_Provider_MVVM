
import 'package:deneme/feature/NotList/ViewModel/not_list_viewmodel.dart';
import 'package:deneme/model/not_model.dart';
import 'package:deneme/product/Padding/page_padding.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class AddNoteScreen extends StatelessWidget {
  const AddNoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var titleController = TextEditingController();
    var contentController = TextEditingController();
    var _noteProvider = Provider.of<NoteProvider>(context, listen: false);
    return ChangeNotifierProvider.value(
      value: _noteProvider,
      builder: (context,child){
        return Scaffold(
        appBar: AppBarMethod(),
        body: PaddingBodyMethod(titleController, contentController, _noteProvider, context),
      );
      },
     
    );
  }

  AppBar AppBarMethod() {
    return AppBar(
        title: const Text('Not Ekle'),
      );
  }

  Padding PaddingBodyMethod(TextEditingController titleController, TextEditingController contentController, NoteProvider _noteProvider, BuildContext context) {
    return Padding(
        padding: const PagePadding.allLow(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            inputtext(titleController, 'Başlık'),
           const SizedBox(height: 16),
            inputtext(contentController, 'İçerik'),
           const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                var newNote = Note(
                  title: titleController.text,
                  content: contentController.text,
                  isCompleted: false,
                );
                _noteProvider.addNote(newNote);
                Navigator.pop(context);
              },
              child:const Text('Kaydet'),
            ),
          ],
        ),
      );
  }
}

TextField inputtext (TextEditingController controller,String labeltext) 
{
  return TextField(
              controller: controller,
              decoration: InputDecoration(labelText: labeltext),
            );
}