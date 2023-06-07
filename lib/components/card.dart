import 'package:api/models/disney_character.dart';
import 'package:api/screens/card_details.dart';
import 'package:flutter/material.dart';

class CharacterSquaredCard extends StatelessWidget {
  const CharacterSquaredCard({super.key, required this.character});

  final DisneyCharacter character;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CharacterDetails(
              character: character,
            ),
          ),
        );
      },
      child: Material(
        elevation: 5,
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Hero(
                  tag: 'image-${character.imageUrl}',
                  child: Image.network(
                    character.imageUrl ??
                        'https://i0.wp.com/thinkmonsters.com/speakinghuman/media/wp-content/uploads/Disney-Updated-Movie-Logo-2011.png?fit=2880%2C1514&ssl=1',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Hero(
				tag: 'name-${character.name}',
				child: Text(
				  character.name!,
				  style: const TextStyle(
					color: Colors.grey,
					fontSize: 16,
					fontWeight: FontWeight.bold,
				  ),
				),
			  ),
            ],
          ),
        ),
      ),
    );
  }
}
