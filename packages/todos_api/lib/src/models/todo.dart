import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:uuid/uuid.dart';

class Todo extends Equatable {
  Todo({
    String? id,
    required this.task,
    this.note = '',
    this.isCompleted = false,
  }) : assert(id == null || id != '', 'id can not be empty string'),
       id = id ?? const Uuid().v4();

  final String id;
  final String task;
  final String note;
  final bool isCompleted;

  @override
  List<Object?> get props => [id, task, note, isCompleted];

  Todo copyWith({String? id, String? task, String? note, bool? isCompleted}) {
    return Todo(
      id: id ?? this.id,
      task: task ?? this.task,
      note: note ?? this.note,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  @override
  String toString() {
    return 'Todo{id: $id, task: $task, note: $note, isCompleted: $isCompleted}';
  }

  factory Todo.fromJson(Map<String, Object?> json) {
    return Todo(
      id: json['id'] as String?,
      task: json['task'] as String,
      note: json['note'] as String? ?? '',
      isCompleted: json['isCompleted'] as bool? ?? false,
    );
  }

  Map<String, Object?> toJson() {
    return {'id': id, 'task': task, 'note': note, 'isCompleted': isCompleted};
  }
}
