import 'dart:convert';

import 'package:daynex_test_calismasi/models/character.dart';
import 'package:daynex_test_calismasi/services/api_services.dart';
import 'package:daynex_test_calismasi/services/dio_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dioClientProvider = Provider<DioClient>((ref){
  return DioClient();
});

final apiServiceProvider = Provider<ApiService>((ref){
  final dio = ref.watch(dioClientProvider).dio;
  return ApiService(dio);
});

final characterProvider = FutureProvider<List<Character>>((ref) async {

  final apiService = ref.watch(apiServiceProvider);

  try{

    final characterDataJson = await apiService.fetchCharacters() ;
    final characters = characterDataJson
        .map((json) => Character.fromJson(json as Map<String, dynamic>))
        .toList();
    return characters;

  }catch(error){
    print('Karakterler çekilirken Riverpod hatası: $error');
    rethrow;
  }
});