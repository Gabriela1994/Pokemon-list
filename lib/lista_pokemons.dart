import 'package:flutter/material.dart';
import 'Servicios/Lista.dart';
import 'Servicios/detalle.dart';
import 'detalle_pokemon.dart';

class ListaPage extends StatefulWidget {
  const ListaPage({super.key, required this.title});

  final String title;

  @override
  State<ListaPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<ListaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Lista de pokemones'),
        ),
        body: Stack(children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/pokemon-lista3.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          Center(
              child: Container(
                  width: 350,
                  height: 600,
                  decoration: BoxDecoration(
                    color: Colors.white
                        .withOpacity(0.5),
                    borderRadius:
                        BorderRadius.circular(15),
                  ),
                  child: ListView(
                    children: [
                      Column(children: <Widget>[
                        FutureBuilder(
                            future: ServicioListadoPokemones.obtenerDatos(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const CircularProgressIndicator();
                              }
                              if (snapshot.hasData) {
                                final pokemons = snapshot.data!;
                                return SingleChildScrollView(
                                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                                    child: Column(
                                      children: pokemons.map((pokemon) {
                                    int pokemonId = pokemon.id;
                                              return Container(
                                              margin: const EdgeInsets.only(bottom: 15),
                                              decoration: BoxDecoration(
                                                color: const Color.fromARGB(255, 132, 226, 227).withOpacity(0.6),
                                                borderRadius: BorderRadius.circular(8),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey.withOpacity(0.4),
                                                    spreadRadius: 1,
                                                    blurRadius: 5,
                                                    offset: const Offset(0, 3),
                                                  ),
                                                ],
                                              ),
                                      child: ListTile(
                                        title: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(pokemon.nombre.toUpperCase(),
                                                      style: const TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 18,
                                                      color: Color.fromARGB(255, 28, 28, 165),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(left: 8.0),
                                              child: Image.network(
                                                  pokemon.imagenUrl,
                                                  fit: BoxFit.cover,
                                                  width: 80,
                                                  height: 60),
                                            ),
                                          ],
                                        ),
                                    onTap: () async {
                                      DetallePokemon pokemon = await obtenerDetallePokemon(pokemonId);
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) {
                                          return DetallePage(title: 'detalle',pokemon: pokemon);
                                        }),
                                      );
                                    }
                                      ));
                                    }).toList()));
                              } else {
                                return const Text('Error');
                              }
                            }),
                      ])
                    ],
                  )))
        ]));
  }
}
