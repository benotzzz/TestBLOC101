import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

class Task extends Equatable {
  final String id;
  final String title;
  final String description;
  final String? createdAt;
  final String? date;
  final bool? isDone;
  final bool? isDeleted;
  final bool? isFavorite;

  Task({
    id,
    required this.title,
    required this.description,
    required this.date,
    createdAt,
    isDone,
    isDeleted,
    isFavorite,
  })  : id = id ?? const Uuid().v4(),
        createdAt = createdAt ?? DateTime.now().toString(),
        isDone = isDone ?? false,
        isDeleted = isDeleted ?? false,
        isFavorite = isFavorite ?? false;

  Task copyWith({
    String? id,
    String? title,
    String? description,
    String? createdAt,
    String? date,
    bool? isDone,
    bool? isDeleted,
    bool? isFavorite,
  }) {
    return Task(
      id: id ?? this.id,
      date: id ?? this.date,
      title: title ?? this.title,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
      isDone: isDone ?? this.isDone,
      isDeleted: isDeleted ?? this.isDeleted,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'date': date,
      'description': description,
      'createdAt': createdAt,
      'isDone': isDone,
      'isDeleted': isDeleted,
      'isFavorite': isFavorite,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'] as String,
      title: map['title'] ??'',
      date: map['date'] ??'',
      description: map['description'] ??'',
      createdAt: map['createdAt'] ??'',
      isDone: map['isDone'] ,
      isDeleted: map['isDeleted'] ,
      isFavorite: map['isFavorite'] ,
    );
  }

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        date,
        createdAt,
        isDone,
        isDeleted,
        isFavorite,
      ];
}
