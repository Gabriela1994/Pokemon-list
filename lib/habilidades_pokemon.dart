import 'package:flutter/material.dart';

class HabilidadesPage extends StatefulWidget {
  const HabilidadesPage(
      {super.key,
      required this.title,
      required this.nombre_pokemon,
      required this.movimientos});

  final String title;
  final String nombre_pokemon;
  final List<String> movimientos;

  @override
  State<HabilidadesPage> createState() => _DetallePage();
}

class _DetallePage extends State<HabilidadesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.nombre_pokemon.toUpperCase()),
      ),
      body: Stack(
        children: [
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
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Movimientos de combate de ${widget.nombre_pokemon}',
                    style: TextStyle(
                      fontSize: 22,
                      color: Color.fromARGB(255, 0, 0, 96),
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),

                  Expanded(
                    child: ListView(
                      children: widget.movimientos.map((ability) {
                        return ListTile(
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.flash_on, size:35, color: const Color.fromARGB(255, 129, 124, 237)),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      ability.toUpperCase(),
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: Color.fromARGB(255, 28, 28, 165),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}