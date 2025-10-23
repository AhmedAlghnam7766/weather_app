import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Search City',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: TextField(
            onSubmitted: (value) {
              final GetWeatherCubit getWeatherCubit =
                  BlocProvider.of<GetWeatherCubit>(context);
              getWeatherCubit.getWeather(cityName: value);
              Navigator.pop(context);
            },
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                vertical: 30,
                horizontal: 9.0,
              ),
              hintText: 'Enter City Name',
              suffixIcon: Icon(Icons.search_rounded),
              suffixIconColor: Colors.blue,
              labelText: 'Search',
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ),
    );
  }
}
