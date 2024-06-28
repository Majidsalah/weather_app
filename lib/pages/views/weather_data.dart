import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_animation/weather_animation.dart';

class WeatherData extends StatelessWidget {
  const WeatherData({super.key});

  @override
  Widget build(BuildContext context) {
    var nEwweatherModel =
        BlocProvider.of<GetWeatherCubit>(context).weatherModel;

    return Scaffold(
      body: Stack(children: [
        PageView(children: [backAnimation(nEwweatherModel!.condition)]),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              nEwweatherModel.cityName,
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text(
                'Updated at ${stringTodate(nEwweatherModel.updatTime).hour}:${stringTodate(nEwweatherModel.updatTime).minute} ',
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.network('https:${nEwweatherModel.image}'),
                Text(
                  '${nEwweatherModel.temp.round()} °C',
                  style: const TextStyle(
                      fontSize: 28, fontWeight: FontWeight.bold),
                ),
                Text(
                    ' Max Temp= ${nEwweatherModel.maxTemp.round()} \n \n Min Temp= ${nEwweatherModel.minTemp.round()}',
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold))
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              nEwweatherModel.condition,
              style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ]),
    );
  }

  Widget backAnimation(String condition) {
    switch (condition) {
      case 'Sunny':
      return WeatherScene.scorchingSun.sceneWidget;
      case 'Clear':
        return WeatherScene.snowfall.sceneWidget;
      case 'Partly cloudy':
      case 'Patchy rain possible':
      case 'Patchy snow possible':
      case 'Patchy sleet possible':
      case 'Patchy freezing drizzle possible':
     return   WeatherScene.showerSleet.sceneWidget;
      case 'Cloudy':
      case 'Overcast':
      case 'Blowing snow':
      case 'Blizzard':
      case 'Fog':
      case 'Freezing fog':
      return  WeatherScene.rainyOvercast.sceneWidget;
      case 'Mist':
      case 'Patchy light drizzle':
      case 'Light drizzle':
      case 'Freezing drizzle':
      case 'Heavy freezing drizzle':
     return   WeatherScene.rainyOvercast.sceneWidget;
      case 'Patchy light rain':
      case 'Light rain':
      case 'Moderate rain at times':
      case 'Moderate rain':
      case 'Heavy rain at times':
      case 'Heavy rain':
       return WeatherScene.stormy.sceneWidget;
      case 'Light freezing rain':
      case 'Moderate or heavy freezing rain':
      case 'Light sleet':
      case 'Moderate or heavy sleet':
        WeatherScene.rainyOvercast.sceneWidget;
      case 'Patchy light snow':
      case 'Light snow':
      case 'Patchy moderate snow':
      case 'Moderate snow':
      case 'Patchy heavy snow':
      case 'Heavy snow':
      case 'Ice pellets':
      case 'Light rain shower':
      case 'Moderate or heavy rain shower':
      case 'Torrential rain shower':
      case 'Light sleet showers':
      case 'Moderate or heavy sleet showers':
      case 'Light snow showers':
      case 'Moderate or heavy snow showers':
      case 'Light showers of ice pellets':
      case 'Moderate or heavy showers of ice pellets':
      return  WeatherScene.showerSleet.sceneWidget;
      case 'Patchy light rain with thunder':
      case 'Moderate or heavy rain with thunder':
      case 'Patchy light snow with thunder':
      case 'Moderate or heavy snow with thunder':
    return    WeatherScene.stormy.sceneWidget;
     
    }

    return Container();
  }
}

DateTime stringTodate(String value) {
  return DateTime.parse(value);
}
