
class WeatherDataCurrent {
  final Current current;

  WeatherDataCurrent({required this.current});

  // Factory constructor for JSON deserialization
  factory WeatherDataCurrent.fromJson(Map<String, dynamic> json) {
    return WeatherDataCurrent(
      current: Current.fromJson(json['current']),
    );
  }

  // Method for JSON serialization
  Map<String, dynamic> toJson() {
    return {
      'current': current.toJson(),
    };
  }
}

class Current {
  final int? temp;
  final int? humidity;
  final int? clouds;
  final double? uvIndex;
  final num? feelsLike;
  final double? windSpeed;
  final List<Weather>? weather;

  Current({
    this.temp,
    this.humidity,
    this.clouds,
    this.uvIndex,
    this.feelsLike,
    this.windSpeed,
    this.weather,
  });

  // Factory constructor for JSON deserialization
  factory Current.fromJson(Map<String, dynamic> json) {
    return Current(
      temp: (json['temp'] as num?)?.round(),
      humidity: json['humidity'] as int?,
      feelsLike: (json['feels_like'] as num?)?.toDouble(),
      uvIndex: (json['uvi'] as num?)?.toDouble(),
      clouds: json['clouds'] as int?,
      windSpeed: (json['wind_speed'] as num?)?.toDouble(),
      weather: (json['weather'] as List<dynamic>?)
          ?.map((e) => Weather.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }


  // Method for JSON serialization
  Map<String, dynamic> toJson() {
    return {
      'temp': temp,
      'feels_like': feelsLike,
      'uvi': uvIndex,
      'humidity': humidity,
      'clouds': clouds,
      'wind_speed': windSpeed,
      'weather': weather?.map((e) => e.toJson()).toList(),
    };
  }
}

class Weather {
  final int? id;
  final String? main;
  final String? description;
  final String? icon;

  Weather({this.id, this.main, this.description, this.icon});

  // Factory constructor for JSON deserialization
  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      id: json['id'] as int?,
      main: json['main'] as String?,
      description: json['description'] as String?,
      icon: json['icon'] as String?,
    );
  }

  // Method for JSON serialization
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'main': main,
      'description': description,
      'icon': icon,
    };
  }
}

