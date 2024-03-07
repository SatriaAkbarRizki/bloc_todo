// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'todo_bloc.dart';

@immutable
sealed class TodoEvent {}

class OnAddedTodo extends TodoEvent {
  final Todo newTodo;

  OnAddedTodo(this.newTodo);
}

class OnUpdatedTodo extends TodoEvent {
  final int index;
  final Todo newTodo;

  OnUpdatedTodo(
    this.index,
    this.newTodo,
  );
}

class OnRemovedTodo extends TodoEvent {
  final int index;

  OnRemovedTodo(
    this.index,
  );
}
