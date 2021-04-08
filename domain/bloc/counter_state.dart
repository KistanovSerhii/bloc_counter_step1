import 'package:flutter/cupertino.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_3/domain/model/counter.dart';

abstract class CounterStates extends Equatable {
  @override
  List<Object> get props => [];
}

class StateInit extends CounterStates {}

class StateCounting extends CounterStates {}

class StateCounted extends CounterStates {
  final Counter counter;
  StateCounted({@required this.counter});
}
