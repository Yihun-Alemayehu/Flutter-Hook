import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ExampleTwo extends HookWidget {
  const ExampleTwo({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController();
    final text = useState('');
    useEffect(
      () {
        controller.addListener(() {
          text.value = controller.text;
        });
        return null;
      },
      [controller],
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              )),
            ),
          )
        ],
      ),
    );
  }
}
