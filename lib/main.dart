import 'package:flutter/material.dart';
import 'package:movies_app/screens/home_screen.dart';
// import 'package:movies_app/screens/home_screen.dart';
import 'package:movies_app/view_model/view_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

    final  prefs = await SharedPreferences.getInstance();

    final localStorage = prefs.getBool("isDarkMode");



    print("fetched from local storage: $localStorage");

    vm.isDarkmode.value = localStorage ?? true;
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: vm.isDarkmode,
      builder: (context, value, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme:vm.isDarkmode.value ? ThemeData.dark() : ThemeData.light(),
          home: HomeScreen(),
        );
      }
    );
  }

}
