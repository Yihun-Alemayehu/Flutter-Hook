import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ExampleFive extends HookWidget {
  const ExampleFive({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'H O M E',
          style: TextStyle(
            letterSpacing: 3,
          ),
        ),
        centerTitle: true,
      ),
    );
  }
}
