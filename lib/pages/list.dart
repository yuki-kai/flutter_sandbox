import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ListPage extends StatelessWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('テスト'),
        ),
        body: Center(
          child: TextButton(
            child: const Text('最初のページに戻る'),
            onPressed: () {
              context.pop();
            },
          ),
        ));
  }
}
