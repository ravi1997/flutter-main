import 'dart:convert';

import 'package:http/http.dart' as http;

import 'application.dart';

class ApplicationService {
  static const String apiUrl = 'https://127.0.0.1:500/api/main';

  Future<List<Application>> fetchApplications() async {
    final response = await http.get(Uri.parse("$apiUrl/"));

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      List<Application> applications =
          body.map((dynamic item) => Application.fromJson(item)).toList();
      return applications;
    } else {
      throw Exception('Failed to load applications');
    }
  }
}
