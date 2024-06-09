import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  static const String baseUrl = 'http://tokobuku.test/api';

  Future<Map<String, dynamic>> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login'),
      body: {'email': email, 'password': password},
    );
    print('Response Status: ${response.statusCode}');
    print('Response Body: ${response.body}');
    return jsonDecode(response.body);
  }
}
