import 'package:bloc_todo/bloc/todo_bloc.dart';
import 'package:bloc_todo/observer/bloc_observer.dart';
import 'package:bloc_todo/screen/Home.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoBloc(),
      child: MaterialApp(
        theme: ThemeData(useMaterial3: true),
        home: const HomePage(),
      ),
    );
  }
}
