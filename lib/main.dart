import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:note_app_myself/add_note_screen.dart';
import 'package:note_app_myself/notes_model.dart';
import 'package:note_app_myself/notes_screen.dart';
import 'package:note_app_myself/theme_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => NotesModel(),
        ),
        ChangeNotifierProvider(create: (context) => ThemeModel())
      ],
      child: ChangeNotifierProvider(
        create: (context) => NotesModel(),
        child: Consumer<ThemeModel>(builder: (context, themeModel, child) {
          return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              routerConfig: routes,
              theme: ThemeData.light(),
              darkTheme: ThemeData.dark(),
              themeMode: themeModel.themeMode);
        }),
      ),
    );
  }
}

final routes = GoRouter(routes: [
  GoRoute(path: '/', builder: (context, state) => const NotesScreen(), routes: [
    GoRoute(
      path: 'add_screen',
      builder: (context, state) => AddNoteScreen(),
    )
  ])
]);
