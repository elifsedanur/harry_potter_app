import 'package:daynex_test_calismasi/providers/character_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'character_detail_screen.dart';

class CharacterListScreen extends ConsumerWidget{
  const CharacterListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final characterAsyncValue = ref.watch(characterProvider);

    return Scaffold(
      appBar: AppBar(
      title: Text("Harry Potter Characters"),
      ),
      body: characterAsyncValue.when(
          data: (characters){
            if(characters.isEmpty){
              return const Center(child: Text("Karakter Bulunamadı"));
            }
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.65,
              ),
              padding: const EdgeInsets.all(10),
              itemCount: characters.length,
                itemBuilder: (context, index){
                final character = characters[index];

                return Card(
                  margin: EdgeInsets.zero,
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => CharacterDetailScreen(character: character)),);
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        ClipRRect(
                          borderRadius: const BorderRadius.vertical(top: Radius.circular(12.0)),
                          child: character.image != null && character.image!.isNotEmpty
                             ? Image.network(
                            character.image!,
                            height: 180,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            alignment: Alignment.topCenter,
                            loadingBuilder: (context, child, loadingProgress){
                              if(loadingProgress == null) return child;
                              return SizedBox(
                              height: 180,
                              width: double.infinity,
                              child: Center(
                              child: CircularProgressIndicator(
                              value: loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!,
                              ),
                              ),
                              );
                              },
                            errorBuilder: (context, error, stackTrace){
                              return Container(
                              height: 180,
                              width: double.infinity,
                              color: Colors.grey[200],
                              child: const Icon(Icons.person, size: 80, color: Colors.grey),
                              );
                              },
                            )
                            :  Container(
                              height: 180,
                              width: double.infinity,
                              color: Colors.grey[200],
                              child: const Icon(Icons.person, size: 80, color: Colors.grey),
                              ),
                          ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                character.name,
                                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 4.0,),
                              Text(
                                'House: ${(character.house == null || character.house!.isEmpty) ? 'Unknown' : character.house}',
                                style: const TextStyle(fontSize: 13),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                'Species: ${(character.species == null || character.species!.isEmpty) ? 'Unknown' : character.species}',
                                style: const TextStyle(fontSize: 13),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              )
                            ],
                          ),
                        )
                            ],
                    ),
                  ),
                );
                }
            );
          },
          error: (error,stackTace){
            return Center(
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    const Icon(Icons.error_outline, color: Colors.red,size: 50,),
                    const SizedBox(height: 10),
                    Text("Karakterler Yüklenirken Bir Hata Oluştu: \n ${error.toString()}", textAlign: TextAlign.center, style: TextStyle(color: Colors.red,fontSize: 16),),
                    const SizedBox(height: 20),
                    ElevatedButton.icon(
                      onPressed: () => ref.invalidate(characterProvider),
                      icon: Icon(Icons.refresh),
                      label: Text("Tekrar Dene", style: TextStyle(fontSize: 18))
                      ),
                ],
                ),
            );
    },
          loading: () => const Center(child: CircularProgressIndicator()),
    )
    );



  }
}