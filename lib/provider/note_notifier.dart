import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_/models/note_model.dart';

final notifierProvider = StateNotifierProvider<Notifier, List<Notes>>((ref) {
  return Notifier();
});

class Notifier extends StateNotifier<List<Notes>> {
  Notifier() : super([]);

  void addNote(Notes note) {
    state = [...state, note];
  }

  void removeNote(Notes note) {
    state = state.where((element) => element != note).toList();
  }
}
