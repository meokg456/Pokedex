import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'pokemon.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Generation> gens = <Generation>[
    Generation(pokemons: List<Pokemon>(), start: 0, end: 150),
    Generation(pokemons: List<Pokemon>(), start: 151, end: 250),
    Generation(pokemons: List<Pokemon>(), start: 251, end: 385),
    Generation(pokemons: List<Pokemon>(), start: 386, end: 492),
    Generation(pokemons: List<Pokemon>(), start: 493, end: 648),
    Generation(pokemons: List<Pokemon>(), start: 649, end: 717),
  ];

  int _index = 0;

  Future<void> initPokemonToGeneration(Generation gen) async {
    var jsonString =
        await DefaultAssetBundle.of(context).loadString('data/dex.json');
    print(jsonString);
    List<dynamic> json = jsonDecode(jsonString);
    for (int i = gen.start; i <= gen.end; i++) {
      var pokemon = Pokemon.fromJson(json[i]);
      gen.pokemons.add(pokemon);
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      for (int i = 0; i < gens.length; i++) initPokemonToGeneration(gens[i]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pokemon',
          style: TextStyle(fontFamily: 'Poke Hollow'),
        ),
        centerTitle: true,
      ),
      body: GridView.count(
        childAspectRatio: 0.70,
        crossAxisCount: 2,
        children: gens[_index]
            .pokemons
            .map((pokemon) => Card(
                  margin: EdgeInsets.all(3),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      SizedBox(
                        height: 15,
                      ),
                      Image.network(
                        pokemon.image,
                        height: 180,
                        width: 180,
                      ),
                      Text(
                        pokemon.name,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            fontFamily: 'Poke Solid',
                            color: Colors.grey[800]),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: pokemon.types.map((type) {
                            Color textColor;
                            Color backgroundColor;
                            switch (type) {
                              case 'grass':
                                {
                                  textColor = Colors.black;
                                  backgroundColor = Colors.green[400];
                                }
                                break;
                              case 'poison':
                                {
                                  textColor = Colors.white;
                                  backgroundColor = Colors.purple;
                                }
                                break;
                              case 'bug':
                                {
                                  textColor = Colors.white;
                                  backgroundColor = Colors.green[800];
                                }
                                break;
                              case 'psychic':
                                {
                                  textColor = Colors.white;
                                  backgroundColor = Colors.pink[400];
                                }
                                break;
                              case 'flying':
                                {
                                  textColor = Colors.black;
                                  backgroundColor = Colors.blue[300];
                                }
                                break;
                              case 'water':
                                {
                                  textColor = Colors.white;
                                  backgroundColor = Colors.blue[600];
                                }
                                break;
                              case 'dark':
                                {
                                  textColor = Colors.white;
                                  backgroundColor = Colors.grey[800];
                                }
                                break;
                              case 'fighting':
                                {
                                  textColor = Colors.white;
                                  backgroundColor = Colors.deepOrange[800];
                                }
                                break;
                              case 'rock':
                                {
                                  textColor = Colors.white;
                                  backgroundColor = Colors.lime[900];
                                }
                                break;
                              case 'ground':
                                {
                                  textColor = Colors.white;
                                  backgroundColor = Colors.brown;
                                }
                                break;
                              case 'ice':
                                {
                                  textColor = Colors.black;
                                  backgroundColor = Colors.blue[100];
                                }
                                break;
                              case 'fairy':
                                {
                                  textColor = Colors.black;
                                  backgroundColor = Colors.pink[100];
                                }
                                break;
                              case 'ghost':
                                {
                                  textColor = Colors.white;
                                  backgroundColor = Colors.deepPurple[600];
                                }
                                break;
                              case 'steel':
                                {
                                  textColor = Colors.black;
                                  backgroundColor = Colors.grey;
                                }
                                break;
                              case 'fire':
                                {
                                  textColor = Colors.white;
                                  backgroundColor = Colors.orange[800];
                                }
                                break;
                              case 'normal':
                                {
                                  textColor = Colors.white;
                                  backgroundColor = Colors.grey[600];
                                }
                                break;
                              case 'electric':
                                {
                                  textColor = Colors.black;
                                  backgroundColor = Colors.yellow;
                                }
                                break;
                              case 'dragon':
                                {
                                  textColor = Colors.white;
                                  backgroundColor =
                                      Colors.deepPurpleAccent[400];
                                }
                                break;
                            }
                            return Container(
                              alignment: Alignment.center,
                              height: 30,
                              width: 85,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: backgroundColor),
                              child: Text(
                                type[0].toUpperCase() + type.substring(1),
                                style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'Poke Solid',
                                    color: textColor),
                              ),
                            );
                          }).toList())
                    ],
                  ),
                ))
            .toList(),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 0),
                leading: IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
                title: Text(
                  'Pokedex',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'Poke Solid'),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            ListTile(
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  _index = 0;
                });
              },
              selected: _index == 0,
              contentPadding: EdgeInsets.symmetric(horizontal: 20),
              leading: CircleAvatar(
                backgroundColor: Colors.transparent,
                child: Image.asset('images/kanto.png'),
              ),
              title: Text(
                'Kanto',
                style: TextStyle(fontSize: 18, fontFamily: 'Poke Solid'),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  _index = 1;
                });
              },
              selected: _index == 1,
              contentPadding: EdgeInsets.symmetric(horizontal: 20),
              leading: CircleAvatar(
                backgroundColor: Colors.transparent,
                child: Image.asset('images/johto.png'),
              ),
              title: Text(
                'Johto',
                style: TextStyle(fontSize: 18, fontFamily: 'Poke Solid'),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  _index = 2;
                });
              },
              selected: _index == 2,
              contentPadding: EdgeInsets.symmetric(horizontal: 20),
              leading: CircleAvatar(
                backgroundColor: Colors.transparent,
                child: Image.asset(
                  'images/heonn.png',
                ),
              ),
              title: Text(
                'Heonn',
                style: TextStyle(fontSize: 18, fontFamily: 'Poke Solid'),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  _index = 3;
                });
              },
              selected: _index == 3,
              contentPadding: EdgeInsets.symmetric(horizontal: 20),
              leading: CircleAvatar(
                backgroundColor: Colors.transparent,
                child: Image.asset(
                  'images/sinnoh.png',
                ),
              ),
              title: Text(
                'Sinnoh',
                style: TextStyle(fontSize: 18, fontFamily: 'Poke Solid'),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  _index = 4;
                });
              },
              selected: _index == 4,
              contentPadding: EdgeInsets.symmetric(horizontal: 20),
              leading: CircleAvatar(
                backgroundColor: Colors.transparent,
                child: Image.asset(
                  'images/unova.png',
                ),
              ),
              title: Text(
                'Unova',
                style: TextStyle(fontSize: 18, fontFamily: 'Poke Solid'),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  _index = 5;
                });
              },
              selected: _index == 5,
              contentPadding: EdgeInsets.symmetric(horizontal: 20),
              leading: CircleAvatar(
                backgroundColor: Colors.transparent,
                child: Image.asset(
                  'images/kalos.png',
                ),
              ),
              title: Text(
                'Kalos',
                style: TextStyle(fontSize: 18, fontFamily: 'Poke Solid'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
