import 'package:bloc/bloc.dart';
import 'package:d_method/d_method.dart';

// Cara Global
class MyBlocObserver extends BlocObserver {
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    DMethod.logTitle(bloc.runtimeType.toString(), transition.toString());
  }
}

/****
 * Bloc Observer adalah dimana kita bisa mengetahu sebuah changed, event maupun error secara global
 * onTransition adalah gabungan dari onChanged, onEvent dan onError
 ****/