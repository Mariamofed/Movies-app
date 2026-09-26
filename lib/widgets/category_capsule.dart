import 'package:flutter/material.dart';

class CategoryCapsule extends StatelessWidget {
  CategoryCapsule({super.key});

  final List<String> genres = ['Action', 'Drama', 'sci-fi'];
  late final String genre = genres.isNotEmpty ? genres.first : '';

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [

         Container(
          padding: EdgeInsets.symmetric(horizontal: 9, vertical: 4),
          decoration: BoxDecoration(
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.grey.shade600.withOpacity(0.6)
                : Colors.grey.shade200.withOpacity(0.6),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Text(
            genre,
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
        ),
      ],
    );
  }
}
