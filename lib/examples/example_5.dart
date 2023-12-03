import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

const url = 'https://avatars.githubusercontent.com/u/101422490?v=4';
const imageHeight = 400.0;

extension Normalize on num {
  num normalized(
    num selfRangeMin,
    num selfRangeMax, [
    num normalizedRangeMin = 0.0,
    num normalizedRangeMax = 1.0,
  ]) =>
      (normalizedRangeMax - normalizedRangeMin) *
          ((this - selfRangeMin) / (selfRangeMax - selfRangeMin)) +
      normalizedRangeMin;
}

class ExampleFive extends HookWidget {
  const ExampleFive({super.key});

  @override
  Widget build(BuildContext context) {
    List<int> person = List<int>.generate(20, (index) => index);
    final opacity = useAnimationController(
      duration: const Duration(seconds: 1),
      initialValue: 0.0,
      lowerBound: 0.0,
      upperBound: 1.0,
    );
    final size = useAnimationController(
      duration: const Duration(seconds: 1),
      initialValue: 0.0,
      lowerBound: 0.0,
      upperBound: 1.0,
    );
    final controller = useScrollController();
    useEffect(
      () {
        controller.addListener(() {
          final newOpacity = max(imageHeight - controller.offset, 0.0);
          final normalized = newOpacity.normalized(0.0, imageHeight).toDouble();
          opacity.value = normalized;
          size.value = normalized;
        });
        return null;
      },
      [controller],
    );

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
      body: Column(
        children: [
          SizeTransition(
            sizeFactor: size,
            axis: Axis.vertical,
            axisAlignment: -1.0,
            child: FadeTransition(
              opacity: opacity,
              child: Image.network(
                url,
                height: imageHeight,
                //fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              controller: controller,
              itemCount: person.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Person $index'),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
