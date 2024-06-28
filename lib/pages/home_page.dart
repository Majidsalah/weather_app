import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/pages/views/no_weather.dart';
import 'package:weather_app/pages/views/search.dart';
import 'package:weather_app/pages/views/weather_data.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Weather app'),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 12),
              child: IconButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return const SearchView();
                    }));
                  },
                  icon: const Icon(Icons.search)),
            )
          ],
        ),
        body: BlocBuilder<GetWeatherCubit, WeatherStates>(
        
            builder: (context, state) {
          if (state is InitialStates) {
            return const NoWether();
          } else if (state is WeatherLoaded) {
            return  WeatherData();
          } else {
            return const Center(
              child: Text('no data'),
            );
          }
        }));
  }
}
