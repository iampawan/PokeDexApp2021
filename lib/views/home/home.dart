import 'package:flutter/material.dart';
import 'package:pokedex_app/model/pokemon.dart';
import 'package:pokedex_app/services/api.dart';
import 'package:pokedex_app/views/home/pokemon_list.dart';

class Home extends StatelessWidget {
  final APIService _apiService = APIService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "PokeDex App",
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: FutureBuilder(
          future: _apiService.getPokemons(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final Pokemon pokemon = snapshot.data;
              return PokemonList(pokemon: pokemon);
            } else
              return Center(
                child: CircularProgressIndicator(),
              );
          }),
    );
  }
}
