import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  static const String baseUrl = 'http://tokobuku.test/api';

  Future<Map<String, dynamic>> register(
      String name,
      String phone,
      String address,
      String email,
      String password,
      String confirmPassword) async {
    final response = await http.post(
      Uri.parse('$baseUrl/register'),
      body: {
        'name': name,
        'phone_number': phone,
        'address': address,
        'email': email,
        'password': password,
        'password_confirmation': confirmPassword,
      },
    );
    print('Response Status: ${response.statusCode}');
    print('Response Body: ${response.body}');
    return jsonDecode(response.body);
  }

  Future<Map<String, dynamic>> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login'),
      body: {'email': email, 'password': password},
      headers: {"Accept": "application/json"},
    );
    print('Response Status: ${response.statusCode}');
    print('Response Body: ${response.body}');
    return jsonDecode(response.body);
  }
}
