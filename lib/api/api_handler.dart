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
Future<void> postRequestWithBearerToken(String url, String token, Map<String, dynamic> body) async {
  try {
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(body),
    );

    if (response.statusCode == 200) {
      print('POST request successful');
      print('Response: ${response.body}');
    } else {
      print('Failed to make the POST request. Status code: ${response.statusCode}');
      print('Response: ${response.body}');
    }
  } catch (e) {
    print('Error: $e');
  }
}
