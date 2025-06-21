import 'package:daynex_test_calismasi/models/character.dart';
import 'package:flutter/material.dart';


class CharacterDetailScreen extends StatelessWidget{

  final Character character;

  const CharacterDetailScreen({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Harry Potter Character Details"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: character.image != null && character.image!.isNotEmpty
                  ? Image.network(
                      character.image!,
                    width: 150,
                    height: 150,
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                    errorBuilder: (context,error,stackTrace){
                        return const Icon(Icons.person,size: 150, color: Colors.grey,);
                    },
                  )
                      : const Icon(Icons.person,size: 150, color: Colors.grey,),
              ),
            ),
            const SizedBox(height: 24.0,),
            Center(
                child: Text(
                  character.name,
                  style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
            ),
            const SizedBox(height: 16.0,),
            _buildTextRow("Alternate Names", character.alternateNames.join(', ')),
            _buildTextRow("Species", character.species),
            _buildTextRow("Gender", character.gender),
            _buildTextRow("House", character.house),
            _buildTextRow("Date Of Birth", character.dateOfBirth),
            _buildTextRow("Year Of Birth", character.yearOfBirth?.toString()),
            _buildTextRow("Ancestry", character.ancestry),
            _buildTextRow("Eye Color", character.eyeColour),
            _buildTextRow("Hair Color", character.hairColour),
            _buildTextRow("Patronus", character.patronus),
            _buildTextRow("Hogwarts Student", character.hogwartsStudent?.toString()),
            _buildTextRow("Hogwarts Staff", character.hogwartsStaff?.toString()),
            _buildTextRow("Actor ", character.actor),
            _buildTextRow("Alternate Actors", character.alternateActors.join(', ')),
            _buildTextRow("Alive", character.alive?.toString()),

            if (character.wand != null &&
                (character.wand!.wood?.isNotEmpty == true ||
                    character.wand!.core?.isNotEmpty == true ||
                    character.wand!.length != null))
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Wand Info", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  const Divider(),
                  const SizedBox(height: 8),
                  _buildTextRow("Wood", character.wand!.wood ),
                  _buildTextRow("Core", character.wand!.core ),
                  _buildTextRow("Length", character.wand!.length?.toString() ),
                ],
              )

          ],
        ),
      ),
    );
  }

  Widget _buildTextRow(String label, String? value){

    //final displayValue = (value == null || value.isEmpty) ? 'Unknown' : value;

    if(value == null || value.isEmpty){
      return const SizedBox.shrink();
    }
    return Padding(
      padding: EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 160,
            child: Text("$label:", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16), ),
          ),
          Expanded(child: Text(value, style: TextStyle(fontSize: 16),)),
        ],
      ),
    );
  }

}