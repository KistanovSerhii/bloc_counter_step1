import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_3/domain/bloc/counter_bloc.dart';
import 'package:flutter_application_3/domain/bloc/counter_state.dart';
import 'package:flutter_application_3/domain/bloc/counter_event.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            BlocBuilder<CounterBloc, CounterStates>(builder: (context, state) {
              if (state is StateInit) {
                return Text("Go ahead, tap someone!");
              }

              if (state is StateCounting) {
                return CircularProgressIndicator();
              }

              if (state is StateCounted) {
                return Text(
                  state.counter.value.toString(),
                  style: Theme.of(context).textTheme.headline4,
                );
              }
            }),
            Center(
              child: Row(
                children: [
                  FloatingActionButton(
                    onPressed: () => BlocProvider.of<CounterBloc>(context)
                        .add(EventIncrement()),
                    tooltip: 'Increment',
                    child: Icon(Icons.add),
                  ),
                  FloatingActionButton(
                    onPressed: () => BlocProvider.of<CounterBloc>(context)
                        .add(EventDecrement()),
                    tooltip: 'Decrement',
                    child: Icon(Icons.remove),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
