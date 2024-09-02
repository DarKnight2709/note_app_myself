import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:note_app_myself/notes_model.dart';
import 'package:note_app_myself/theme_model.dart';
import 'package:provider/provider.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notes'), actions: [
        Consumer<ThemeModel>(
          builder: (context, themeModel, child) {
            return IconButton(
              icon:
                  Icon(themeModel.isDark ? Icons.dark_mode : Icons.light_mode),
              onPressed: () {
                themeModel.toggleTheme();
              },
            );
          },
        ),
      ]),
      body: Consumer<NotesModel>(
        builder: (_, model, child) {
          return ListView.builder(
            itemCount: model.notes.length,
            itemBuilder: (context, index) {
              Note note = model.notes[index];
              return ListTile(
                title: Text(note.title),
                subtitle: Text(note.content),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    model.removeNote(note.id);
                  },
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.go('/add_screen');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
