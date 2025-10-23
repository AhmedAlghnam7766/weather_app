import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_state.dart';
// import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/pages/home_page.dart';
// import 'package:weather_app/services/weather_service.dart';

void main() async {
  runApp(const MyApp());

  // WeatherModel weatherModel = await WeatherService().getWeather(city: 'cairo');
  // print(weatherModel.iconPath);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) {
          return BlocBuilder<GetWeatherCubit, WeatherState>(
            builder: (context, state) {
              String? condition;

              if (state is WeatherLoadedState) {
                condition = state.weatherModel.text;
              } else {
                condition = null;
              }
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                // making the defaut font is googlefonts.your font text theme
                theme: ThemeData(
                  textTheme: GoogleFonts.openSansTextTheme(
                    Theme.of(context).textTheme,
                  ),
                  primarySwatch: getThemeColor(condition: condition),
                  useMaterial3: false,
                ),
                home: const HomePage(),
              );
            },
          );
        },
      ),
    );
  }
}

MaterialColor getThemeColor({required String? condition}) {
  if (condition == null) return Colors.blue;

  switch (condition.toLowerCase()) {
    case 'sunny':
    case 'clear':
      return Colors.orange;

    case 'partly cloudy':
    case 'cloudy':
    case 'overcast':
      return Colors.blueGrey;

    case 'mist':
    case 'fog':
    case 'freezing fog':
      return Colors.grey;

    case 'patchy rain possible':
    case 'patchy light drizzle':
    case 'light drizzle':
    case 'patchy light rain':
    case 'light rain':
      return Colors.lightBlue;

    case 'moderate rain':
    case 'moderate rain at times':
    case 'heavy rain':
    case 'heavy rain at times':
      return Colors.indigo;

    case 'patchy snow possible':
    case 'light snow':
    case 'patchy light snow':
    case 'moderate snow':
    case 'patchy heavy snow':
    case 'blizzard':
    case 'blowing snow':
      return Colors.lightBlue;

    case 'thundery outbreaks possible':
    case 'patchy light rain with thunder':
    case 'moderate or heavy rain with thunder':
    case 'patchy light snow with thunder':
    case 'moderate or heavy snow with thunder':
      return Colors.deepPurple;

    case 'ice pellets':
    case 'light showers of ice pellets':
    case 'moderate or heavy showers of ice pellets':
    case 'patchy sleet possible':
    case 'light sleet':
    case 'moderate or heavy sleet':
    case 'light sleet showers':
    case 'moderate or heavy sleet showers':
      return Colors.teal;

    default:
      return Colors.blue;
  }
}
