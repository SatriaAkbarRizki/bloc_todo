import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../models/todo.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(TodoState([], TodoStatus.init)) {
    on<OnAddedTodo>((event, emit) {
      Todo newTodo = event.newTodo;
      emit(TodoState([...state.todos, newTodo], TodoStatus.added));
    });

    on<OnUpdatedTodo>((event, emit) {
      // Data baru
      Todo newTodo = event.newTodo;
      int indexUpdate = event.index;

      // Data saat ini
      List<Todo> todoUpdate = state.todos;
      todoUpdate[indexUpdate] = newTodo;
      emit(TodoState(todoUpdate, TodoStatus.update));
    });

    on<OnRemovedTodo>((event, emit) async {
      emit(TodoState(state.todos, TodoStatus.loading));
      await Future.delayed(const Duration(milliseconds: 1000));
      List<Todo> newTodo = state.todos;
      newTodo.removeAt(event.index);
      emit(TodoState(newTodo, TodoStatus.removed));
    });
  }

//  Ini cara loccal

  // @override
  // void onChange(Change<TodoState> change) {
  //   log(change.toString());
  //   super.onChange(change);
  // }

  // @override
  // void onEvent(TodoEvent event) {
  //   log(event.toString());
  //   super.onEvent(event);
  // }
}


/****
 * Kalau masih bingung, banyangin aja
 * kalau event itu adalah data baru yang user input sedangkan 
 * state adalah data saat ini, sebelum dimasukan dengan yang baru
 * 
 * Kalau data event.newTodo didapatkan ketika assignment function addTodo di HomePage.
 * Lalu dari mana didapatkan nya data state.todos??
 * 
 * state.todos awalnya kosong namun ketika kita lakukan emit maka secara tidak langsung
 * itu akan insert data ke todos
 ****/