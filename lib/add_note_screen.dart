import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:note_app_myself/notes_model.dart';
import 'package:provider/provider.dart';

class AddNoteScreen extends StatelessWidget {
  AddNoteScreen({super.key});

  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Add Note"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextFormField(
                controller: _controller1,
                decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: "Title",
                    filled: false),
              ),
              TextFormField(
                controller: _controller2,
                decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: "Content",
                    filled: false),
                maxLines: 5,
              ),
              const SizedBox(height: 20),
              TextButton(
                child: const Text("Add Note"),
                onPressed: () {
                  if(_controller1.text.isEmpty || _controller2.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text(
                                  "You must fill in the blanks completely")));
                  } else {
                    context
                          .read<NotesModel>()
                          .addNote(_controller1.text, _controller2.text);
                   context.go('/');
                  }
                },
              )
            ],
          ),
        ));
  }
}
