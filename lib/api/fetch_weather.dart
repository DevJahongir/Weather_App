import 'dart:convert';

import 'package:climate/api/api_key.dart';
import 'package:climate/model/weather_data.dart';
import 'package:climate/model/weather_data_current.dart';
import 'package:climate/model/weather_data_daily.dart';
import 'package:climate/model/weather_data_hourly.dart';
import 'package:http/http.dart' as http;

import '../utils/api_url.dart';

class FetchWeatherApi {
  WeatherData? weatherDate;

  // procecsing the data from response -> to json

  Future<WeatherData> processDate(lat, lon) async {
    var response = await http.get(Uri.parse(apiURL(lat, lon)));
    var jsonString = jsonDecode(response.body);
    weatherDate = WeatherData(
        WeatherDataCurrent.fromJson(jsonString),
        WeatherDataHourly.fromJson(jsonString),
        WeatherDataDaily.fromJson(jsonString));

    return weatherDate!;
  }
}
