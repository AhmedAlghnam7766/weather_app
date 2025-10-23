import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  final Dio dio = Dio();
  final String baseUrl = 'http://api.weatherapi.com/v1';
  final String apiKey = 'put_your_api_key';

  Future<WeatherModel> getWeather({required String city}) async {
    try {
      final Response response = await dio.get(
        '$baseUrl/forecast.json?key=$apiKey&q=$city&days=1&aqi=no&alerts=no',
      );
      final WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errorMessage =
          e.response?.data['error']['message'] ??
          'Oobs, there was an error. try later.';
      throw Exception(errorMessage);
    } catch (e) {
      throw Exception('Oobs, there was an error. try later.');
    }
  }
}
