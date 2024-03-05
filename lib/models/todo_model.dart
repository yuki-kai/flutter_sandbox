import 'package:supabase_flutter/supabase_flutter.dart';

class Todo {
  final supabase = Supabase.instance.client;

  SupabaseStreamFilterBuilder getAll() =>
      supabase.from('todos').stream(primaryKey: ['id']);
}
