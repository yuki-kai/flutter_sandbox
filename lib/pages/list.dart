import 'package:flutter/material.dart';
import 'package:flutter_sandbox/models/todo_model/todo_model.dart';
import 'package:flutter_sandbox/repositories/todo_repository.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ListPage extends ConsumerWidget {
  String title = '';
  String description = '';
  ListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final supabase = Supabase.instance.client;
    final _todoRepository = TodoRepository();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('TODO'),
      ),
      body: StreamBuilder(
        stream: _todoRepository.getAll(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, int index) {
              final todo = snapshot.data[index];
              return Card(
                  child: ListTile(
                title: Text(todo['title']),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () async => {
                    await _todoRepository.delete(todo['id']),
                  },
                ),
              ));
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('タイトル'),
                  content:
                      Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                    TextField(
                      decoration: const InputDecoration(
                        hintText: 'タイトル',
                      ),
                      onChanged: (value) => title = value,
                    ),
                    TextField(
                      decoration: const InputDecoration(
                        hintText: '詳細',
                      ),
                      onChanged: (value) => description = value,
                    ),
                  ]),
                  actions: [
                    TextButton(
                      onPressed: () => context.pop(),
                      child: const Text('キャンセル'),
                    ),
                    TextButton(
                      onPressed: () async {
                        try {
                          await supabase.from('todos').insert({
                            'title': title,
                            'description': description,
                            'is_completed': false,
                          });
                        } catch (e) {
                          print('===== エラー =====');
                          print(e);
                        } finally {
                          context.pop();
                        }
                      },
                      child: const Text('追加'),
                    ),
                  ],
                );
              });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
