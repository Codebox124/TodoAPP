import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final valueProvider = Provider<int>((ref) => 20);

class ProviderPage extends ConsumerWidget {
  const ProviderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Provider"),
      ),
      body: Center(
        child: Text(
          'The value is ${ref.watch(valueProvider)}',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
