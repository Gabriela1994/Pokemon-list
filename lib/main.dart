import 'package:flutter/material.dart';
import 'lista_pokemons.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ejemplo AppBar',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Bienvenida'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

final String title;

@override
State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Poke-enciclopedia'),
        ),
        body: Stack(children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/pokemon-bienvenida.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          Center(
              child: Container(
              width: 300, // Ancho del contenedor
              height: 400, // Alto del contenedor
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.5),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                  mainAxisAlignment:
                      MainAxisAlignment.center,
                  crossAxisAlignment:
                      CrossAxisAlignment.center,
                  children: [
                const Text(
                  '¡Bienvenido a la poke-enciclopedia!',
                  style: TextStyle(
                    fontSize: 24,
                    color:  Color.fromARGB(255, 0, 0, 96),
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context){
                          return const ListaPage(
                            title: 'Nueva vista'
                          );
                        }),
                      );
                    },
                  style:  ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(208, 170, 62, 123),
                    shape: const StadiumBorder(),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 15), 
                  ),
                  child: const Text(
                    'Ver lista de pokemones',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ])))
        ]));
  }
}