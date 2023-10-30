import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod2_counter/counter.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends ConsumerWidget {

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int state = ref.watch(counterProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$state',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              final notifier = ref.read(counterProvider.notifier);
              notifier.resetCounter();
            },
            child: const Icon(Icons.exposure_zero),
          ),
          FloatingActionButton(
            onPressed: (){
              final notifier = ref.read(counterProvider.notifier);
              notifier.decrementCounter();
            },
            child: const Icon(Icons.remove),
          ),
          FloatingActionButton(
            onPressed: (){
              final notifier = ref.read(counterProvider.notifier);
              notifier.incrementCounter();
              // ref.read(counterProvider.notifier).incrementCounter();
            },
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () {
              final notifier = ref.read(counterProvider.notifier);
              notifier.multiplyCounter();
            },
            child: const Icon(Icons.close),
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
