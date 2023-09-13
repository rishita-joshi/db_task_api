import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:version_task/model/location_model.dart';

class HttPConfig {
  static Future<LocationModel> callLocationDetails(
      String lat, String long) async {
    final response = await http.get(Uri.parse(
        "https://nominatim.openstreetmap.org/reverse?format=json&lat=${lat}&lon=${long}&zoom=18&addressdetails=1s̄"));
    print(response.body);
    if (response.statusCode == 200) {
      var parsed = jsonDecode(response.body);
      print(response.body);
      LocationModel list = LocationModel.fromJson(parsed);
      return list;
    } else {
      throw Exception('Failed to load Data');
    }
  }
}
