class Generation {
  List<Pokemon> pokemons;
  int start;
  int end;
  Generation({this.pokemons, this.start, this.end});
}

class Pokemon {
  int id;
  String number;
  String name;
  String height;
  String weight;
  String description;
  String image;
  List<String> types;
  List<Evolution> evolutions;
  Pokemon(
      {this.id,
      this.number,
      this.name,
      this.height,
      this.weight,
      this.image,
      this.types,
      this.description,
      this.evolutions});
  Pokemon.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    height = json['height'];
    weight = json['weight'];
    description = json['description'];
    image = json['image'];
    List<dynamic> jsonTypes = json['types'];
    types = List<String>();

    for (int i = 0; i < jsonTypes.length; i++) types.add(jsonTypes[i]);

    List<dynamic> jsonEvolutions = json['evolutions'];
    evolutions = List<Evolution>();
    for (int i = 0; i < jsonEvolutions.length; i++) {
      evolutions.add(Evolution.fromJson(jsonEvolutions[i]));
    }
  }
  Map<String, dynamic> toJson() {
    var json = Map<String, dynamic>();
    json['id'] = id;
    json['name'] = name;
    json['height'] = height;
    json['weight'] = weight;
    json['description'] = description;
    json['image'] = image;
    json['types'] = types;
    json['evolutions'] = evolutions;
    return json;
  }
}

class Evolution {
  int id;
  String name;
  Evolution({this.id, this.name});
  Evolution.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
  }
  Map<String, dynamic> toJson() {
    var json = Map<String, dynamic>();
    json['name'] = name;
    json['id'] = id;
    return json;
  }
}
