import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final valueStateProvider = StateProvider.autoDispose<int>((ref) => 0);


class StateProviderPage extends ConsumerWidget {
  const StateProviderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.watch(valueStateProvider);
    ref.listen<int>(valueStateProvider, (prev, currt)=>{
      if(currt == 20){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Value is equal to 20")))
      }
    });
    return Scaffold(

      appBar: AppBar(
        title: Text("State Provider"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Value : $value"),
            ElevatedButton(onPressed: () {
              ref.read(valueStateProvider.notifier).state++;
            }, child: Text("Add")),
              ElevatedButton(onPressed: () {
              ref.read(valueStateProvider.notifier).state--;
            }, child: Text("Sub")),
             ElevatedButton(onPressed: () {
              ref.invalidate(valueStateProvider);
            }, child: Text("Reset"))
          ],
        ),
      ),
      
    );
  }
}