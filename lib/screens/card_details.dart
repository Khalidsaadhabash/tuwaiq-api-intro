import 'dart:developer';

import 'package:api/models/disney_character.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CharacterDetails extends StatelessWidget {
  const CharacterDetails({super.key, required this.character});

  final DisneyCharacter character;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Hero(
          tag: 'name-${character.name}',
          child: Text(character.name ?? 'Disney'),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          Hero(
            tag: 'image-${character.imageUrl}',
            child: Image.network(character.imageUrl ??
                'https://i0.wp.com/thinkmonsters.com/speakinghuman/media/wp-content/uploads/Disney-Updated-Movie-Logo-2011.png?fit=2880%2C1514&ssl=1'),
          ),
          const SizedBox(
            height: 24,
          ),
          GridView.count(
            shrinkWrap: true,
            primary: false,
            padding: const EdgeInsets.all(20),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
            children: [
              for (final film in character.films ?? <String>[])
                Material(
                  elevation: 10,
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    child: Center(
                      child: Text(
                        film,
                        // style: const TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                )
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          TextButton(
            onPressed: () {
              log('Go to ${character.sourceUrl}');
              launchUrl(Uri.parse(character.sourceUrl ?? ''));
            },
            child: const Text('More information'),
          )
        ],
      ),
    );
  }
}
