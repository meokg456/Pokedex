import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/main_screen.dart';
import 'package:pokedex/pokemon_detail.dart';
import 'package:pokedex/splash_screen.dart';

void main() {
  debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  runApp(Pokedex());
}

class Pokedex extends StatelessWidget {
  const Pokedex({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        accentColor: Colors.blueAccent,
        primaryColor: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/main': (context) => MainScreen(),
        '/detail': (context) => PokemonDetail()
      },
    );
  }
}
