import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_/models/sugession.dart';
import 'package:riverpod_/services/api_services.dart';

final suggestionFutureProvider =
    FutureProvider.autoDispose<Suggestion>((ref) async {
  final apiservice = ref.watch(apiServiceProvider);
  return apiservice.getSuggestion();
});

class FutureProviderPage extends ConsumerWidget {
  const FutureProviderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sugessionRef = ref.watch(suggestionFutureProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("Future Provider"),
      ),
      body: RefreshIndicator(
        onRefresh: () => ref.refresh(suggestionFutureProvider.future),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              sugessionRef.when(
                data: (data) {
                  return Text(data.activity);
                },
                
                error: (error, stackTrace) {
                  return Text(error.toString());
                },
                loading: () {
                  return CircularProgressIndicator();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
