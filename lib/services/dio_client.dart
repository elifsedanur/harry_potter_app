import 'package:dio/dio.dart';

class DioClient{
  final Dio _dio;

  DioClient() : _dio = Dio(
    BaseOptions(
        baseUrl: 'https://hp-api.onrender.com/api'
    )
  );

  Dio get dio => _dio;
}