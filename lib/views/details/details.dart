import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pokedex_app/model/pokemon.dart';

class Details extends StatelessWidget {
  final PokemonElement poke;

  const Details({Key key, @required this.poke}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final img = poke.img.replaceAll("http", "https");
    return Scaffold(
      appBar: AppBar(
        title: Text(
          poke.name,
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Hero(
                tag: poke.id,
                child: Image.network(
                  img,
                  fit: BoxFit.cover,
                  height: 150,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              poke.name,
              style: TextStyle(
                color: Colors.green.shade800,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            Card(
              elevation: 0.0,
              child: Column(
                children: [
                  ListTile(
                    title: Text("Height"),
                    subtitle: Text(poke.height),
                  ),
                  ListTile(
                    title: Text("Weight"),
                    subtitle: Text(poke.weight),
                  ),
                  ListTile(
                    title: Text("Candy"),
                    subtitle: Text(poke.candyCount.toString()),
                  ),
                  ListTile(
                    title: Text("Avg Spawns"),
                    subtitle: Text(poke.avgSpawns.toString()),
                  ),
                  ListTile(
                    title: Text("Egg"),
                    subtitle: Text(poke.egg.toString()),
                  ),
                  ListTile(
                    title: Text("Weakness"),
                    subtitle: Wrap(
                      children: poke.weaknesses
                          .map(
                            (e) => Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Chip(
                                backgroundColor:
                                    Colors.primaries[Random().nextInt(9)],
                                label: Text(
                                  typeValues.reverseMap[e],
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                  if (poke.nextEvolution != null)
                    ListTile(
                      title: Text("Evolution"),
                      subtitle: Wrap(
                        children: poke.nextEvolution
                            .map(
                              (e) => Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Text(
                                  e.name,
                                  style: TextStyle(color: Colors.pink),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ListTile(
                    title: Text("Type"),
                    subtitle: Wrap(
                      children: poke.type
                          .map(
                            (e) => Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Text(
                                typeValues.reverse[e],
                                style: TextStyle(color: Colors.indigo),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
