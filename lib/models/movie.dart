class Movie {
  final String id;
  final String title;
  final String description;
  final String posterUrl;
  final String videoUrl;
  final int releaseYear;
  final double rating;
  final List<String> genres;

  Movie({
    required this.id,
    required this.title,
    required this.description,
    required this.posterUrl,
    required this.videoUrl,
    required this.releaseYear,
    required this.rating,
    this.genres = const [],
  });

  factory Movie.fromSupabase(Map<String, dynamic> data) {
    return Movie(
      id: data['id'].toString(),
      title: data['title'] ?? '',
      description: data['description'] ?? '',
      posterUrl: data['poster_url'] ?? '',
      videoUrl: data['video_url'] ?? '',
      releaseYear: (data['release_year'] ?? 0).toInt(),
      rating: (data['rating'] ?? 0.0).toDouble(),
      genres: data['genres'] != null ? List<String>.from(data['genres']) : [],
    );
  }

  Map<String, dynamic> toSupabase() {
    return {
      'title': title,
      'description': description,
      'poster_url': posterUrl,
      'video_url': videoUrl,
      'release_year': releaseYear,
      'rating': rating,
      'genres': genres,
    };
  }
}
