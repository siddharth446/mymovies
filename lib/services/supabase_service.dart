import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/movie.dart';

class SupabaseService {
  final _supabase = Supabase.instance.client;

  // Stream of movies from Supabase for real-time updates
  Stream<List<Movie>> getMoviesStream() {
    return _supabase
        .from('movies')
        .stream(primaryKey: ['id'])
        .order('title')
        .map((data) => data.map((json) => Movie.fromSupabase(json)).toList());
  }

  // Search movies by title
  Future<List<Movie>> searchMovies(String query) async {
    final response = await _supabase
        .from('movies')
        .select()
        .ilike('title', '%$query%');
    
    return (response as List).map((json) => Movie.fromSupabase(json)).toList();
  }

  // Get all movies (one-time fetch)
  Future<List<Movie>> fetchMovies() async {
    final response = await _supabase
        .from('movies')
        .select()
        .order('release_year', ascending: false);
    
    return (response as List).map((json) => Movie.fromSupabase(json)).toList();
  }
}
