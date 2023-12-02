import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

extension CompactMap<T> on Iterable<T?> {
  
}

class ExampleThree extends HookWidget {
  const ExampleThree({super.key});

  @override
  Widget build(BuildContext context) {
    final textController = useTextEditingController();
    final text = useState('');

    useEffect(
      () {
        textController.addListener(() {
          text.value = textController.text;
        });
        return null;
      },
      [textController],
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
              controller: textController,
              decoration: InputDecoration(
                  hintText: 'Type here',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  )),
            ),
          ),
          text.value.isNotEmpty
              ? Text(' You typed ${text.value}')
              : const Text(''),
        ],
      ),
    );
  }
}
