import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:peliculas/config/api_keys.dart';
import 'package:peliculas/models/models.dart';

class MoviesProvider extends ChangeNotifier {
  final String _apikey = apiKey;
  final String _baseURL = 'api.themoviedb.org';
  final String _language = 'es-ES';

  List<Movie> onDisplayMovie = [];

  MoviesProvider() {
    print('MoviesProvider inicializado');
    getOnDisplayMovie();
  }

  getOnDisplayMovie() async {
    var url = Uri.https(_baseURL, '3/movie/now_playing',
        {'api_key': _apikey, 'language': _language, 'page': '1'});

    final response = await http.get(url);
    final nowPlayingResponse = NowPlayingResponse.fromJson(response.body);
    onDisplayMovie = nowPlayingResponse.results;
  }
}
