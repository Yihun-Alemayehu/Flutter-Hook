import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

Stream<String> getTime() => Stream.periodic(
      const Duration(seconds: 1),
      (_) => DateTime.now().toIso8601String(),
    );

class ExamopleOne extends HookWidget {
  const ExamopleOne({super.key});

  @override
  Widget build(BuildContext context) {
    final dateTime = useStream(getTime());
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
        title: Text(dateTime.data ?? 'Home Page'),
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
