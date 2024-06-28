import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/pages/api_request/getting_data.dart';
import 'package:weather_app/pages/api_request/weather_model.dart';

class GetWeatherCubit extends Cubit<WeatherStates> {
  

  GetWeatherCubit() : super(InitialStates());
   WeatherModel? weatherModel;

 
  getWeather({required String cityName}) async {
    try {
       weatherModel= await
          RequestClass(Dio()).gettingData(city: cityName);
      emit(WeatherLoaded());
    } catch (e) {
      emit(WeatherFailuiarState());
    }
  }




}
