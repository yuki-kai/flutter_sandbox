import 'package:flutter_sandbox/index.dart';
import 'package:flutter_sandbox/pages/list.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  debugLogDiagnostics: true,
  initialLocation: '/',
  routes: [
    GoRoute(
        name: 'index',
        path: '/',
        routes: [
          GoRoute(
            name: 'list',
            path: 'list',
            builder: (context, state) => ListPage(),
          ),
        ],
        builder: (context, state) => IndexPage()),
  ],
);
