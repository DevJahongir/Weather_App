import 'package:climate/api/fetch_weather.dart';
import 'package:climate/model/weather_data.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class GlobalController extends GetxController {
  // create various variables
  final RxBool _isLoading = true.obs;
  final RxDouble _lattitude = 0.0.obs;
  final RxDouble _longitude = 0.0.obs;
  final RxInt _currentIndex = 0.obs;

  // instance for them to be called
  RxBool checkLoading() => _isLoading;

  RxDouble getLattitude() => _lattitude;

  RxDouble getLongitude() => _longitude;

  final weatherData = WeatherData().obs;

 WeatherData getWeatherData(){
    return weatherData.value;
  }

  @override
  void onInit() {
    if (_isLoading.isTrue) {
      getLocation();
    }else{
      getIndex();
    }
    super.onInit();
  }

  Future<void> getLocation() async {
    bool isServiceEnabled;
    LocationPermission locationPermission;

    isServiceEnabled = await Geolocator.isLocationServiceEnabled();
    // return if service is not enabled
    if (!isServiceEnabled) {
      return Future.error("Location not enabled");
    }

    // status of permission
    locationPermission = await Geolocator.checkPermission();

    if (locationPermission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are denied forever');
    } else if (locationPermission == LocationPermission.denied) {
      locationPermission = await Geolocator.requestPermission();
      if (locationPermission == LocationPermission.denied) {
        return Future.error("Location permission is denied");
      }
    }

    try {
      Position value = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      _lattitude.value = value.latitude;
      _longitude.value = value.longitude;

      // calling our weather api
      return FetchWeatherApi()
          .processDate(value.latitude, value.longitude)
          .then((value) {
            weatherData.value = value;
        _isLoading.value = false;
      });

      _isLoading.value = false; // Update loading status
    } catch (e) {
      // Handle errors from Geo locator.getCurrentPosition
      return Future.error("Failed to get location: $e");
    }
  }

  RxInt getIndex(){
   return _currentIndex;
  }
}
