import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../counter.dart';

/// {@template counter_view}
/// A [StatelessWidget] which reacts to the provided
/// [CounterCubit] state and notifies it in response to user input.
/// {@endtemplate}
class CounterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final counterCubit = BlocProvider.of<CounterCubit>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Counter')),
      body: Center(
        child: BlocBuilder<CounterCubit, int>(
          builder: (context, state) {
            return Text('$state', style: textTheme.headline2);
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            key: const Key('counterView_increment_floatingActionButton'),
            child: const Icon(Icons.add),
            onPressed: () => counterCubit.increment(),
          ),
          const SizedBox(height: 8),
          BlocBuilder<CounterCubit, int>(
            builder: (context, state) {
              return FloatingActionButton(
                key: const Key('counterView_decrement_floatingActionButton'),
                backgroundColor: state == 0 ? Colors.grey : Colors.blue,
                child: const Icon(Icons.remove),
                onPressed: () => counterCubit.decrement(),
              );
            },
          ),
        ],
      ),
    );
  }
}
