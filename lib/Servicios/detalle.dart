import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pokemon_app/Servicios/stats.dart';

class DetallePokemon {
  final int id;
  final String nombre;
  final List<String> especies;
  final String imagenUrl;
  final int altura;
  final int peso;
  final List<String> movimientos;
  final Stats stats;


  DetallePokemon({
    required this.id,
    required this.nombre, 
    required this.especies, 
    required this.imagenUrl,
    required this.altura,
    required this.peso,
    required this.movimientos,
    required this.stats
    });
}

Future<DetallePokemon> obtenerDetallePokemon(int id) async {
  try {
    final response = await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon/${id}'));

    if (response.statusCode == 200) {
      var respuestaParse = jsonDecode(response.body);

  var movimientos=  respuestaParse['moves'];

print(movimientos);
  List<String> lista_movimientos = [];
  for (var movimiento in movimientos) {
    String nombre = movimiento['move']['name'];
    lista_movimientos.add(nombre);
  }
      String speciesUrl = respuestaParse['species']['url'];
      
      final especiesResponse = await http.get(Uri.parse(speciesUrl));
        var data_especies = jsonDecode(especiesResponse.body);

      // Obtener las estadísticas
      int hp = respuestaParse['stats'][0]['base_stat'];
      int attack = respuestaParse['stats'][1]['base_stat'];
      int defense = respuestaParse['stats'][2]['base_stat'];
      int special_attack = respuestaParse['stats'][3]['base_stat'];
      int special_defense = respuestaParse['stats'][4]['base_stat'];
      int speed = respuestaParse['stats'][5]['base_stat'];

      return DetallePokemon(
        id: respuestaParse['id'],
        nombre: respuestaParse['name'],

        especies: (data_especies['egg_groups'] as List).map((especie) {
          return especie['name'].toString();
        }).toList(),

        imagenUrl: respuestaParse['sprites']['front_default'],
        altura: respuestaParse['height'],
        peso: respuestaParse['weight'],
        movimientos: lista_movimientos,
      
        stats: Stats(hp, attack, defense, special_attack, special_defense, speed),

      );
    } else {
      throw Exception('Error al obtener los datos');
    }
  } catch (e) {
    throw Exception(e);
  }
}

