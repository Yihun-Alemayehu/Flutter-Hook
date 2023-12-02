import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CountDown extends ValueNotifier<int> {
  late StreamSubscription sub;
  CountDown({required int from}) : super(from) {
    sub = Stream.periodic(const Duration(seconds: 1), (value) => from - value)
        .takeWhile((value) => value >= 0)
        .listen((event) {
      value = event;
    });
  }

  @override
  void dispose() {
    sub.cancel();
    super.dispose();
  }
}

class ExampleFour extends HookWidget {
  const ExampleFour({super.key});

  @override
  Widget build(BuildContext context) {
    final countDown = useMemoized(() => CountDown(from: 30));
    final notifier = useListenable(countDown);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Count Down'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Center(
            child: Text(
              notifier.value.toString(),
              style: const TextStyle(
                fontSize: 100,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
