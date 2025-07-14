import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'models/note.dart';
import 'screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(NoteAdapter());
  await Hive.openBox<Note>('notes');
  runApp(const NoteXApp());
}

class NoteXApp extends StatelessWidget {
  const NoteXApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NoteX',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
      ),
      darkTheme: ThemeData.dark(),
      home: const HomeScreen(),
    );
  }
}
