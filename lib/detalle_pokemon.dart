import 'package:flutter/material.dart';
import 'Servicios/detalle.dart';
import 'habilidades_pokemon.dart';

class DetallePage extends StatefulWidget {
  const DetallePage({super.key, required this.title, required this.pokemon});

  final String title;
  final DetallePokemon pokemon;

  @override
  State<DetallePage> createState() => _ListaPage();
}

class _ListaPage extends State<DetallePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.pokemon.nombre.toUpperCase()),
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
              color: Colors.white.withOpacity(0.5),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Text(
                      '${widget.pokemon.nombre.toUpperCase()}',
                      style:
                          TextStyle(fontSize: 30, 
                          color: const Color.fromARGB(255, 113, 102, 184),
                          fontWeight: FontWeight.bold),
                    )),
                Container(
                  width: 200,
                  height: 250,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      widget.pokemon.imagenUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Center(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                      Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 191, 241, 191)
                                  .withOpacity(0.9),
                              borderRadius: BorderRadius.circular(80),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color.fromARGB(250, 51, 106, 27),
                                  blurRadius: 2,
                                  offset: Offset(-1, 1),
                                ),
                              ],
                            ),
                            margin: EdgeInsets.symmetric(
                                vertical: 0, horizontal: 60),
                            padding: EdgeInsets.all(5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.pets, size: 16),
                                SizedBox(width: 8),
                                Expanded(
                                  child: Center(
                                      child: Text(
                                    'Especie: ${widget.pokemon.especies.join(", ")}',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  )),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.trending_up, size: 20, color: const Color.fromARGB(255, 118, 115, 165)),
                              SizedBox(width: 8),
                              Text('Height: ${widget.pokemon.altura}',
                              style: TextStyle(
                                        fontSize: 14,
                                        color: const Color.fromARGB(255, 118, 115, 165)
                                  )),
                              
                              SizedBox(width: 30),
                              Icon(Icons.scale, size: 16,  color: const Color.fromARGB(255, 118, 115, 165)),
                              SizedBox(width: 8),
                              Text('Weight: ${widget.pokemon.peso}',
                              style: TextStyle(
                                        fontSize: 14,
                                        color: const Color.fromARGB(255, 118, 115, 165)
                                  )),
                            ],
                          ),
                          Text('Estadísticas de combate',
                              style: TextStyle(
                                  fontSize: 20, 
                                  color: const Color.fromARGB(255, 67, 61, 157),
                                  fontWeight: FontWeight.bold)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.favorite, size: 16),
                              SizedBox(width: 8),
                              Text('HP: ${widget.pokemon.stats.hp}'),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.arrow_upward, size: 16),
                              SizedBox(width: 8),
                              Text('Attack: ${widget.pokemon.stats.attack}'),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.shield, size: 16),
                              SizedBox(width: 8),
                              Text('Defense: ${widget.pokemon.stats.defense}'),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.flash_on, size: 16),
                              SizedBox(width: 8),
                              Text(
                                  'Special Attack: ${widget.pokemon.stats.special_attack}'),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.shield_outlined, size: 16),
                              SizedBox(width: 8),
                              Text(
                                  'Special Defense: ${widget.pokemon.stats.special_defense}'),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.speed, size: 16),
                              SizedBox(width: 8),
                              Text('Speed: ${widget.pokemon.stats.speed}'),
                            ],
                          ),
                        ],
                      )
                    ])),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    String nombre = widget.pokemon.nombre;
                    var lista_movimientos = widget.pokemon.movimientos;
                    // Navegar a la nueva pantalla
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return HabilidadesPage(
                          title: 'Nueva vista',
                          nombre_pokemon: nombre,
                          movimientos: lista_movimientos,
                        );
                      }),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 67, 61, 157),
                    shape: const StadiumBorder(),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 10),
                  ),
                  child: const Text(
                    'Ver movimientos de combate',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
