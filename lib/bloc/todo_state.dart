part of 'todo_bloc.dart';

enum TodoStatus { init, loading, added, update, removed }

class TodoState {
  final List<Todo> todos;
  TodoStatus status;
  TodoState(this.todos, this.status);
}



/****
 * Untuk meringkas code, kita akan menggunakan enum pada state agar tidak banyak implementasi code
 * Berikut ini dibawah adalah kode sebelum nya
 ****/

// final class TodoInitial extends TodoState {
//   const TodoInitial(super.todos);
// }

// final class TodoLoading extends TodoState {
//   const TodoLoading(super.todos);
// }

// final class TodoAdded extends TodoState {
//   const TodoAdded(super.todos);
// }

// final class TodoUpdated extends TodoState {
//   const TodoUpdated(super.todos);
// }

// final class TodoRemoved extends TodoState {
//   const TodoRemoved(super.todos);
// }
