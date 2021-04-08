import 'package:flutter/widgets.dart';

class Counter {
  int value;
  Counter({@required this.value});

  void increment() {
    value++;
  }

  void decrement() {
    value--;
  }
}
