import 'dart:convert';
import 'dart:math' as math;

import 'package:api/components/card.dart';
import 'package:api/models/disney_character.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({
    super.key,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<DisneyCharacter> characters = [];
  int error = 0;

  Future getCharacters(int count) async {
    while (characters.length < count) {
      final randomCharacter = math.Random().nextInt(7438);
      final baseUrl = 'https://api.disneyapi.dev/character/$randomCharacter';
      final url = Uri.parse(baseUrl);
      final request = await http.get(url);
      final jsonValue = jsonDecode(request.body);
      if (jsonValue['data'].length > 0) {
        final character = DisneyCharacter.fromJson(jsonValue['data']);
        if (character.name != null) {
          characters.add(character);
          setState(() {});
        }
      }
    }
  }

  @override
  void initState() {
    getCharacters(9);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 81, 137, 174),
      body: SafeArea(
        child: Center(
            child: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 1,
          children: [for (final char in characters) CharacterSquaredCard(character: char)],
        )),
      ),
    );
  }
}
