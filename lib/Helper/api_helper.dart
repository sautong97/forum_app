import 'package:http/http.dart' as http;
import 'dart:convert';

class APIHelper {
  static Future<dynamic> get(String urlString) async {
    var url = Uri.parse(urlString);
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      String responseBody = response.body;
      return json.decode(responseBody);
    } else {
      print("Error calling to $url. Response Code: ${response.statusCode.toString()}");
      return null;
    }
  }
}
