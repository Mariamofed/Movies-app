import 'package:flutter/material.dart';
import 'package:movies_app/models/movie_model.dart';

final vm = ViewModel();

class ViewModel {
  /// All movies loaded from the API
  ValueNotifier<List<MovieModel>> movies =
      ValueNotifier<List<MovieModel>>([]);

  /// User's favorite movies
  ValueNotifier<List<MovieModel>> FavoriteMovies =
      ValueNotifier<List<MovieModel>>([]);

  /// Theme mode flag
  ValueNotifier<bool> isDarkmode = ValueNotifier<bool>(true);

  /// Current page for pagination
  int currentPage = 1;

  void toggleDarkMode() {
  
    isDarkmode.value = !isDarkmode.value;
  }

  void addfavorite(MovieModel model) {
    FavoriteMovies.value = [...FavoriteMovies.value, model];
  }

  void removefavorite(MovieModel model) {
    FavoriteMovies.value = FavoriteMovies.value
        .where((movie) => movie.id != model.id)
        .toList();
  }
}



