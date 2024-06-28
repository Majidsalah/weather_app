import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search a City'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.blueGrey, Colors.white],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: TextField(
              onSubmitted: (value) {
                var throwingDataToCubit =
                    BlocProvider.of<GetWeatherCubit>(context);
                throwingDataToCubit.getWeather(cityName: value);

                Navigator.of(context).pop();
              },
              decoration: const InputDecoration(
                  hintText: 'Enter the City name',
                  hintStyle: TextStyle(color: Colors.grey),
                  labelText: 'Search',
                  labelStyle: TextStyle(color: Colors.grey),
                  suffixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4.0)),
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
