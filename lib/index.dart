import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class IndexPage extends StatelessWidget {
  const IndexPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('サンドボックス'),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(
              Icons.list,
              size: 24.0,
            ),
            title: const Text(
              'TODOリスト',
              style: TextStyle(color: Colors.black, fontSize: 18.0),
            ),
            trailing: const Icon(Icons.navigate_next),
            onTap: () => context.go('/list'),
            onLongPress: () => print('onLongPress called.'),
          ),
        ],
      ),
    );
  }
}
