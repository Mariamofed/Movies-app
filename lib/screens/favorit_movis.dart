import 'package:flutter/material.dart';
import 'package:movies_app/view_model/view_model.dart';
import 'package:movies_app/widgets/movie_card.dart';

class FavoriteMovies extends StatelessWidget {
  const FavoriteMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Favorite Movies")),
      body: ValueListenableBuilder(
        valueListenable: vm.FavoriteMovies,
        builder: (context, favoriteMovies, child) {
          if (favoriteMovies.isEmpty) {
            return const Center(child: Text('No favorite movies.'));
          }

          return ListView.builder(
            itemCount: favoriteMovies.length,
            itemBuilder: (context, index) {
              return MovieCard(model: favoriteMovies[index]);
            },
          );
        },
      ),
    );
  }
}
