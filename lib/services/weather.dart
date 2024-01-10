import 'package:weather_clima/services/location.dart';
import 'package:weather_clima/services/networking.dart';

const apiKay = 'ae356de5a94bc38ec4f0d088ec5dd60b';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityWeatherData(String cityName) async {
    // to check the serviceEnabled & get the location
    Location location = Location();
    await location.getCurrentLocation();
    NetworkingHelper networkingHelper = NetworkingHelper(
        url: '$openWeatherMapURL?q=$cityName&appid=$apiKay&units=metric');

    var weatherData = await networkingHelper.getData();
    return weatherData;
  }

  Future<dynamic> getWeatherData() async {
    Location location = Location();
    await location.getCurrentLocation();
    print('Dos: 4');
    NetworkingHelper networkingHelper = NetworkingHelper(
      url:
          '$openWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKay&units=metric',
    );
    // Rmember await only future
    var weatherData = await networkingHelper.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
