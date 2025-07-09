import 'dart:convert';

import 'package:super_hero_app/data/model/superhero_response.dart';
import 'package:http/http.dart' as http;

class Repository {
  Future<SuperheroResponse?> fetchSuperheroInfo(String name) async {
    final response = await http.get(
      Uri.parse(
        "https://superheroapi.com/api/1fb1d78560692ca013d42260718ed007/search/$name",
        //flutter run -d chrome --web-port=5000 --web-browser-flag "--disable-web-security" ejectuar este comando para web
      ),
    );

    if (response.statusCode == 200) {
      var decodedJson = jsonDecode(response.body);
      SuperheroResponse superheroResponse = SuperheroResponse.fromJson(
        decodedJson,
      );

      return superheroResponse;
    } else {
      //throw Exception('Failed to load superhero info'); Util para realizar pruebas
      return null; // Return null para evitar el error
    }
  }
}
