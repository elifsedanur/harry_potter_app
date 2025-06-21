import 'package:dio/dio.dart';

class ApiService{
  final Dio _dio;

  ApiService(this._dio);

  Future<List<dynamic>> fetchCharacters() async {

    try{

      final response = await _dio.get("/characters");
      if(response.statusCode == 200) {
        return response.data;
      }
      else{
        throw Exception('API isteği başarısız: ${response.statusCode}');
      }
    }
    catch(e){
      throw Exception('Bilinmeyen bir hata oluştu: $e');
    }
  }

}