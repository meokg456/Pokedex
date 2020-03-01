import 'package:flutter/material.dart';
import 'package:pokedex/pokemon.dart';

import 'main_screen.dart';

class PokemonDetail extends StatelessWidget {
  const PokemonDetail({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Pokemon> pokemons = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            width: MediaQuery.of(context).size.width - 20,
            left: 10.0,
            top: MediaQuery.of(context).size.height * 0.1,
            bottom: MediaQuery.of(context).size.height * 0.01,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 20),
                children: <Widget>[
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.16,
                  ),
                  Text(
                    pokemons[0].name,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    pokemons[0].description,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 13),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Height: ' +
                        (int.parse(pokemons[0].height) / 10).toString() +
                        ' m',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Weight: ' +
                        (int.parse(pokemons[0].weight) / 10).toString() +
                        ' kg',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Types',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: pokemons[0].types.map((type) {
                        var colors = typeColor(type);
                        return Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          alignment: Alignment.center,
                          height: 30,
                          width: 85,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: colors[1]),
                          child: Text(
                            type[0].toUpperCase() + type.substring(1),
                            style: TextStyle(fontSize: 12, color: colors[0]),
                          ),
                        );
                      }).toList()),
                  SizedBox(
                    height: 20,
                  ),
                  pokemons.length > 1
                      ? Text(
                          'Evolutions',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      : SizedBox(),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 200,
                    child: ListView(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        children: pokemons.map((pokemon) {
                          if (pokemon == pokemons[0]) return Container();
                          return InkWell(
                            onTap: () {
                              List<Pokemon> evolutions = <Pokemon>[pokemon];
                              for (int i = 0; i < pokemons.length; i++) {
                                if (pokemon != pokemons[i]) {
                                  evolutions.add(pokemons[i]);
                                }
                              }
                              Navigator.pop(context);
                              Navigator.pushNamed(context, '/detail',
                                  arguments: evolutions);
                            },
                            child: Hero(
                              tag: pokemon.image,
                              child: Card(
                                elevation: 2,
                                margin: EdgeInsets.all(10),
                                child: Column(
                                  children: <Widget>[
                                    Image.network(
                                      pokemon.image,
                                      height: 150,
                                      width: 150,
                                    ),
                                    Text(
                                      pokemon.name,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }).toList()),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Hero(
              tag: pokemons[0].image,
              child: Container(
                height: 180,
                width: 180,
                child: Image.network(pokemons[0].image),
              ),
            ),
          ),
        ],
      ),
      appBar: AppBar(
        elevation: 0,
        title: Text(
          pokemons[0].name,
          style: TextStyle(fontFamily: 'Poke Hollow'),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.blue,
    );
  }
}
