import 'package:hive/hive.dart';

part 'note.g.dart'; // Bu dosya build_runner ile üretilecek

@HiveType(typeId: 0)
class Note extends HiveObject {
  @HiveField(0)
  String content;

  @HiveField(1)
  DateTime createdAt;

  Note({
    required this.content,
    required this.createdAt,
  });
}
