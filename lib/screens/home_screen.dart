import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import '../models/note.dart';
import '../widgets/note_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Box<Note> noteBox;
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _searchController = TextEditingController();
  String searchText = '';

  @override
  void initState() {
    super.initState();
    noteBox = Hive.box<Note>('notes');
  }

  void _addNote(String content) {
    if (content.trim().isEmpty) return;
    final newNote = Note(content: content, createdAt: DateTime.now());
    noteBox.add(newNote);
    _controller.clear();
    setState(() {});
  }

  void _editNote(Note note) {
    _controller.text = note.content;
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Edit Note'),
        content: TextField(
          controller: _controller,
          autofocus: true,
        ),
        actions: [
          TextButton(
            onPressed: () {
              note.content = _controller.text;
              note.save();
              _controller.clear();
              Navigator.pop(context);
              setState(() {});
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  void _deleteNote(Note note) {
    note.delete();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    List<Note> notes = noteBox.values.toList();
    if (searchText.isNotEmpty) {
      notes = notes
          .where((note) =>
          note.content.toLowerCase().contains(searchText.toLowerCase()))
          .toList();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('NoteX'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                hintText: 'Search notes...',
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (val) {
                setState(() {
                  searchText = val;
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Enter a note...',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () => _addNote(_controller.text),
                ),
              ),
            ),
          ),
          Expanded(
            child: notes.isEmpty
                ? const Center(child: Text('No notes yet...'))
                : ListView.builder(
              itemCount: notes.length,
              itemBuilder: (context, index) {
                final note = notes[index];
                return NoteCard(
                  note: note,
                  onDelete: () => _deleteNote(note),
                  onTap: () => _editNote(note),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
