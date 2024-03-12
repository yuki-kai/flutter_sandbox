import 'package:supabase_flutter/supabase_flutter.dart';

class TodoRepository {
  final supabase = Supabase.instance.client.from('todos');

  getAll() {
    return supabase.stream(primaryKey: ['id']);
  }

  Future<void> delete(int id) async {
    return supabase.delete().match({'id': id});
  }
}
