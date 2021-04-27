import 'package:flutter/material.dart';
import 'package:pokedex_app/model/pokemon.dart';
import 'package:pokedex_app/views/details/details.dart';

class PokemonList extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonList({Key key, @required this.pokemon}) : super(key: key);

  goToDetails(BuildContext context, PokemonElement poke) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Details(poke: poke),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemCount: pokemon.pokemon.length,
      itemBuilder: (context, index) {
        final poke = pokemon.pokemon[index];
        final image = poke.img.replaceAll("http", "https");
        return Card(
          elevation: 3.0,
          child: InkWell(
            splashColor: Colors.lightGreen,
            onTap: () {
              goToDetails(context, poke);
            },
            child: Column(children: [
              Expanded(
                child: Hero(
                  tag: poke.id,
                  child: Image.network(image),
                ),
              ),
              Text(
                poke.name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ]),
          ),
        );
      },
    );
  }
}
