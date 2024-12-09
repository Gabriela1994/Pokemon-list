import 'dart:convert';
import 'package:http/http.dart' as http;


class Pokemon {
  final String nombre;
  final String imagenUrl;
  final int id;

  Pokemon({required this.id, required this.nombre, required this.imagenUrl});
}

class ServicioListadoPokemones {
  static Future<List<Pokemon>> obtenerDatos() async {
    try {
      final response = await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon'));
      
      if (response.statusCode == 200) {
        var respuestaParse = jsonDecode(response.body);
        List<Pokemon> pokemons = [];

        for (var pokemon in respuestaParse['results']) {

          final detalleResponse = await http.get(Uri.parse(pokemon['url']));
          if (detalleResponse.statusCode == 200) {

            var detalleParse = jsonDecode(detalleResponse.body);

          int id = detalleParse['id'];

            String imagenUrl = detalleParse['sprites']['front_default'];

              pokemons.add(Pokemon(
              id: id,
              nombre: pokemon['name'],
              imagenUrl: imagenUrl,
            ));
          }
        }
        return pokemons;
      } else {
        throw Exception('Error al obtener los datos');
      }
    } catch (e) {
      return []; 
    }
  }
}
