import 'dart:developer';

import 'package:bloc/bloc.dart';
import './counter_event.dart';
import './counter_state.dart';
import 'package:flutter_application_3/domain/model/counter.dart';

class CounterBloc extends Bloc<CounterEvent, CounterStates> {
  final Counter counter;

  CounterBloc({this.counter}) : super(StateInit());

  @override
  Stream<CounterStates> mapEventToState(CounterEvent event) async* {
    switch (event.runtimeType) {
      case EventIncrement:
        yield StateCounting();
        counter.increment();
        yield StateCounted(counter: counter);
        break;
      case EventDecrement:
        yield StateCounting();
        counter.decrement();
        yield StateCounted(counter: counter);
        break;
      default:
    }
  }
}
