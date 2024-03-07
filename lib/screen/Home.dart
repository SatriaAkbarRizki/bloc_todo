import 'package:bloc_todo/bloc/todo_bloc.dart';
import 'package:bloc_todo/widget/simple_input.dart';
import 'package:d_info/d_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/todo.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  addTodo() {
    final titleController = TextEditingController();
    final descriptionController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) =>
          SimpleDialog(contentPadding: const EdgeInsets.all(20), children: [
        SimpleInput(
          actionTitle: 'Add Todo',
          titleController: titleController,
          descriptionController: descriptionController,
          actionButton: () {
            Todo todo = Todo(
                title: titleController.text,
                description: descriptionController.text);
            context.read<TodoBloc>().add(OnAddedTodo(todo));
            DInfo.snackBarSuccess(context, 'berhasil menambahkan todo baru');
            Navigator.pop(context);
          },
        )
      ]),
    );
  }

  updateTodo(int index, Todo todo) {
    final titleController = TextEditingController();
    final descriptionController = TextEditingController();
    titleController.text = todo.title;
    descriptionController.text = todo.description;

    showDialog(
      context: context,
      builder: (context) =>
          SimpleDialog(contentPadding: const EdgeInsets.all(20), children: [
        SimpleInput(
          actionTitle: 'Edit Todo',
          titleController: titleController,
          descriptionController: descriptionController,
          actionButton: () {
            Todo todo = Todo(
                title: titleController.text,
                description: descriptionController.text);
            context.read<TodoBloc>().add(OnUpdatedTodo(index, todo));
            DInfo.snackBarSuccess(context, 'berhasil mengubah todo');
            Navigator.pop(context);
          },
        )
      ]),
    );
  }

  removeTodo(int index) {
    DInfo.dialogConfirmation(context, 'Hapus Todo',
            'Apakah kamu benar benar ingin menghapus todo?',
            textYes: 'Iya', textNo: 'Tidak')
        .then((value) {
      if (value == true) {
        context.read<TodoBloc>().add(OnRemovedTodo(index));
        DInfo.snackBarSuccess(context, 'Berhasil Menghapus todo');
      }
    });
    ;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo dengan Bloc'),
      ),
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          if (state.status == TodoStatus.init || state.todos.isEmpty) {
            return const Center(
              child: Text('Todo tidak ada, silahkan buat todo..'),
            );
          }
          if (state.status == TodoStatus.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          List<Todo> listTodo = state.todos;

          return ListView.builder(
            itemCount: listTodo.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(child: Text('${index + 1}')),
                title: Text(listTodo[index].title),
                subtitle: Text(listTodo[index].description),
                trailing: PopupMenuButton(
                  onSelected: (value) {
                    switch (value) {
                      case 'edit':
                        updateTodo(index, listTodo[index]);
                        break;
                      case 'delete':
                        removeTodo(index);
                        break;
                      default:
                    }
                  },
                  itemBuilder: (context) => [
                    const PopupMenuItem(value: 'edit', child: Text('Edit')),
                    const PopupMenuItem(value: 'delete', child: Text('Delete'))
                  ],
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: addTodo, child: const Icon(Icons.add)),
    );
  }
}
