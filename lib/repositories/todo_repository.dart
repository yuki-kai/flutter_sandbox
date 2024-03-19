import 'package:flutter_sandbox/models/todo_model/todo_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class TodoRepository {
  final supabase = Supabase.instance.client.from('todos');

  getAll() {
    return supabase.stream(primaryKey: ['id']);
  }

  Future<void> insert(Todo todo) async {
    await supabase.insert({...todo.toJson()});
  }

  Future<void> delete(int id) async {
    await supabase.delete().match({'id': id});
  }
}
