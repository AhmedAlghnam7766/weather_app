import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherBody extends StatelessWidget {
  const WeatherBody({super.key});

  @override
  Widget build(BuildContext context) {
    final WeatherModel weatherModel = BlocProvider.of<GetWeatherCubit>(
      context,
    ).weatherModel!;

    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            getThemeColor(condition: weatherModel.text),
            getThemeColor(condition: weatherModel.text).shade100,
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // city & time
          Column(
            children: [
              Text(
                weatherModel.city,
                style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'updated at: ${DateTime.parse(weatherModel.lastUpdate).hour}:${DateTime.parse(weatherModel.lastUpdate).minute}',
                style: const TextStyle(fontSize: 22),
              ),
            ],
          ),

          const SizedBox(height: 50),

          // weather info
          SizedBox(
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,

              children: [
                CachedNetworkImage(
                  width: 100,
                  imageUrl: weatherModel.iconPath.startsWith('http')
                      ? weatherModel.iconPath
                      : 'https:${weatherModel.iconPath}',
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) =>
                      const Icon(Icons.error_outline, size: 100),
                ),

                Text(
                  '${weatherModel.currentTemp.round()}',
                  style: const TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                // temps avg, max, min
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Avg Temp: ${weatherModel.averageTemp.round()}'),
                    Text('Max Temp: ${weatherModel.maxTemp.round()}'),
                    Text('Min Temp: ${weatherModel.minTemp.round()}'),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 50),

          // weather status text
          Text(
            weatherModel.text,
            style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 50),
        ],
      ),
    );
  }
}
