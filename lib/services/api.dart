import 'package:http/http.dart' as http;
import 'package:pokedex_app/model/pokemon.dart';

class APIService {
  final String _url =
      "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";

  // Fetch pokemons
  Future<Pokemon> getPokemons() async {
    final response = await http.get(Uri.parse(_url));
    if (response.statusCode == 200) {
      final pokemon = pokemonFromJson(response.body);
      print(pokemon.toJson());
      return pokemon;
    } else {
      print("Some error occured");
      return null;
    }
  }
}
