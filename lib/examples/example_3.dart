import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

extension CompactMap<T> on Iterable<T?> {
  Iterable<T> compactMap<E>([
    E? Function(T?)? transform,
  ]) =>
      map(
        transform ?? (e) => e,
      ).where((e) => e != null).cast();
}

const url =
    'https://c4.wallpaperflare.com/wallpaper/851/501/292/programming-code-minimalism-wallpaper-preview.jpg';

class ExampleThree extends HookWidget {
  const ExampleThree({super.key});

  @override
  Widget build(BuildContext context) {
    final image = useMemoized(
      () => NetworkAssetBundle(Uri.parse(url))
          .load(url)
          .then(
            (data) => data.buffer.asUint8List(),
          )
          .then(
            (data) => Image.memory(data),
          ),
    );

    final snapshot = useFuture(image);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          snapshot.hasData ? snapshot.data! : null,
        ].compactMap().toList(),
      ),
    );
  }
}
