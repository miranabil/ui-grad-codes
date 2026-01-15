import 'package:http/http.dart' as http;
import 'dart:convert';

class UserInfoService {
  static const String _baseUrl =
      'https://yallarewards-hfhxdxerb8caa8g9.switzerlandnorth-01.azurewebsites.net/api';

  static Future<int> fetchUserPoints(String userId) async {
    final url = Uri.parse('$_baseUrl/UserInfo/points/$userId');

    final response = await http.get(url);

    if (response.statusCode != 200) {
      throw Exception('Failed to load user points');
    }

    final decoded = jsonDecode(response.body);
    return decoded['totalPoints'] as int;
  }
}
