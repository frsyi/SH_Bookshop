import 'package:flutter/material.dart';
import 'package:sarana_hidayah/model/user.dart';
import 'package:sarana_hidayah/service/auth_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  Future<void> login(
      BuildContext context, String email, String password) async {
    final response = await AuthService.login(email, password);
    if (response['status'] == 'Login success!') {
      User user = User.fromJson(response['data']);
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', response['access_token']);
      Navigator.of(context).pushReplacementNamed('/home');
    } else {
      _showErrorDialog(context, 'Login Failed', response['message']);
    }
  }

  Future<void> register(BuildContext context, String name, String email,
      String password, String confirmPassword) async {
    final response =
        await AuthService.register(name, email, password, confirmPassword);
    if (response['success']) {
      User user = User.fromJson(response['data']);
      Navigator.of(context).pushReplacementNamed('/login');
    } else {
      _showErrorDialog(context, 'Registration Failed', response['message']);
    }
  }

  Future<void> logout(BuildContext context) async {
    final response = await AuthService.logout();
    if (response['status'] == 'Logout success!') {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.remove('token');
      Navigator.of(context).pushReplacementNamed('/login');
    } else {
      _showErrorDialog(context, 'Logout Failed', response['message']);
    }
  }

  void _showErrorDialog(BuildContext context, String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
