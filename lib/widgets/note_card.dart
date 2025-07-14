import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/note.dart';

class NoteCard extends StatelessWidget {
  final Note note;
  final VoidCallback onDelete;
  final VoidCallback onTap;

  const NoteCard({
    super.key,
    required this.note,
    required this.onDelete,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(note.key.toString()),
      onDismissed: (direction) => onDelete(),
      background: Container(
        color: Colors.red,
        padding: const EdgeInsets.only(left: 20),
        alignment: Alignment.centerLeft,
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          child: ListTile(
            title: Text(note.content),
            subtitle: Text(
              DateFormat('dd MMM yyyy – HH:mm').format(note.createdAt),
              style: const TextStyle(fontSize: 12),
            ),
            trailing: const Icon(Icons.edit),
          ),
        ),
      ),
    );
  }
}
