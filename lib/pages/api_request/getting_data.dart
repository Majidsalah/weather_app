import 'dart:developer';

import 'package:dio/dio.dart';

import 'package:weather_app/pages/api_request/weather_model.dart';

class RequestClass {
  final Dio dio ;

  final String apiKey = '4fafea306ef24b76b4200144240505';
  final String baseUrl = 'https://api.weatherapi.com/v1';

  RequestClass(this.dio);
  Future<WeatherModel> gettingData({required String city}) async {
    try {
      Response response =
          await dio.get('$baseUrl/forecast.json?key=$apiKey&q=$city&days=1');

      WeatherModel weatherModel = WeatherModel.fromJason(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errormessage =
          e.response?.data['error']['message'] ?? 'oops therer was an error';

      throw Exception(errormessage);
    }
     catch (e) {
      log(e.toString());
      throw Exception('oops therer was an error');
    }
  }
}

