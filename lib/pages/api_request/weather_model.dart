class WeatherModel {
  final String cityName;
  final String condition;
  final double maxTemp;
  final double minTemp;
  final double temp;
  final String updatTime;
  final String image;

  WeatherModel(
      {required this.cityName,
      required this.image, 
      required this.condition,
      required this.maxTemp,
      required this.minTemp,
      required this.temp,
      required this.updatTime, });

  factory WeatherModel.fromJason(jason) {
    return WeatherModel(
        cityName: jason['location']['name'],
        condition: jason['current']['condition']['text'],
        maxTemp: jason['forecast']['forecastday'][0]['day']['maxtemp_c'],
        minTemp: jason['forecast']['forecastday'][0]['day']['mintemp_c'],
        temp: jason['forecast']['forecastday'][0]['day']['avgtemp_c'],
        image:jason['current']['condition']['icon'],
        updatTime: jason['current']['last_updated']);
  }
}
