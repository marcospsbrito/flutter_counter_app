import 'package:counter_app/counter/cubit/counter_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CounterCubit - when create...', () {
    late CounterCubit counterCubit;

    setUp(() {
      counterCubit = CounterCubit();
    });

    test('initial state is 0', () {
      expect(counterCubit.state, 0);
    });

    test('and increment than state is 1', () {
      counterCubit.increment();
      expect(counterCubit.state, 1);
    });

    test('and decrement than state is 0', () {
      counterCubit.decrement();
      expect(counterCubit.state, 0);
    });

    test('and increment and decrement state is 0', () {
      counterCubit.increment();
      counterCubit.decrement();
      expect(counterCubit.state, 0);
    });

    test('and decrement and increment state is 1', () {
      counterCubit.decrement();
      counterCubit.increment();
      expect(counterCubit.state, 1);
    });

    test('and increment 10 times than state is 10', () {
      for (var i = 1; i <= 10; i++) {
        counterCubit.increment();
      }
      expect(counterCubit.state, 10);
    });

    test('and decrement 10 times than state is 0', () {
      for (var i = 1; i <= 10; i++) {
        counterCubit.decrement();
      }
      expect(counterCubit.state, 0);
    });
  });
}
