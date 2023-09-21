import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:random_user_app/user_model.dart';

class ApiService {
  final String apiUrl = "https://randomuser.me/api/?results=20";

  Future<List<UserModel>> getUsers() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['results'];
      return data.map((user) => UserModel.fromJson(user)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }
}