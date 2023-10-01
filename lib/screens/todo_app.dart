import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_/models/note_model.dart';
import 'package:riverpod_/provider/note_notifier.dart';

class TodoHome extends ConsumerWidget {
  const TodoHome({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final noteList = ref.watch(notifierProvider);
    final titleController = TextEditingController();
    final contentController = TextEditingController();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (_) {
              return AlertDialog(
                content: Container(
                  height: 160,
                
                  child: Column(
                    children: [
                      TextField(
                        controller: titleController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          labelText: 'Title',
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                        controller: contentController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          labelText: 'Content',
                        ),
                      ),
                    ],
                  ),
                ),
                actions: [
                  ElevatedButton(
                      onPressed: () {
                        ref.read(notifierProvider.notifier).addNote(Notes(
                            title: titleController.text,
                            content: contentController.text));
                        Navigator.pop(context);
                      },
                      child: Text("Add Note"))
                ],
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(title: Text("Todo App")),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          noteList.isEmpty
              ? Center(
                  child: const Text(
                  "Add Note!",
                  style: TextStyle(fontSize: 24),
                ))
              : ListView.builder(
                  itemCount: noteList.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(noteList[index].title),
                      subtitle: Text(noteList[index].content),
                      trailing: IconButton(
                          onPressed: () {
                            ref
                                .read(notifierProvider.notifier)
                                .removeNote(noteList[index]);
                          },
                          icon: Icon(Icons.delete)),
                    );
                  })
        ],
      ),
    );
  }
}
