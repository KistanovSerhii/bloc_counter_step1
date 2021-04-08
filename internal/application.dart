import 'package:flutter/material.dart';
import 'package:flutter_application_3/presentation/home/home.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_3/domain/bloc/counter_bloc.dart';
import 'package:flutter_application_3/domain/model/counter.dart';

class MyApp extends StatelessWidget {
  CounterBloc _counterBloc = CounterBloc(counter: Counter(value: 0));

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => _counterBloc,
        child: HomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}
