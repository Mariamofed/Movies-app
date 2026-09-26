// import 'dart:nativewrappers/_internal/vm/bin/vmservice_io.dart';

// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/screens/favorit_movis.dart';
import 'package:movies_app/services/api_service.dart';
import 'package:movies_app/view_model/view_model.dart';
import 'package:movies_app/widgets/movie_card.dart';
import 'package:shared_preferences/shared_preferences.dart';




class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {
  // String? get isDarkmode => null;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    

    ApiService.sendRequest(vm.currentPage);
    _scrollController.addListener( (){
      print(_scrollController.position.pixels);
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent){

        ApiService.sendRequest(vm.currentPage);
      }
    });
    ApiService.sendRequest(vm.currentPage);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerEnableOpenDragGesture: false,
      appBar: AppBar(
        title: Text("Popular Movies"),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () async {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FavoriteMovies(),
                ),
              );
              // await SharedPreferences.getInstance();
            },
            icon: Icon(Icons.favorite_outline, color: Colors.red),
          ),
          IconButton(
            onPressed: () async {
              final SharedPreferences prefs =
                  await SharedPreferences.getInstance();
              await prefs.setBool("isDarkmode", !vm.isDarkmode.value);
              vm.isDarkmode.value = !vm.isDarkmode.value;
            },
            icon: Icon(Icons.bedtime),
          ),
        ],
      ),
      body: ValueListenableBuilder(
        valueListenable: vm.movies,
        builder: (context, value, child) {
          return vm.movies.value.isEmpty
              ? Center(child: Text("No movies yet"))
              : ListView.builder(
                controller: _scrollController,
                  padding: EdgeInsets.only(top: 30, right: 12, left: 12),
                  itemCount: vm.movies.value.length,
                  itemBuilder: (context, index) {
                    return MovieCard(model: vm.movies.value[index]);
                  },
                );
        },
      ),
    );
  }
}