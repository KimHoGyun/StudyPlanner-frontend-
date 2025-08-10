import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'http://localhost:8080/api';

  static Future<Map<String, dynamic>> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/auth/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );

    return jsonDecode(response.body);
  }

  static Future<Map<String, dynamic>> signup(String email, String password, String name) async {
    final response = await http.post(
      Uri.parse('$baseUrl/auth/signup'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password, 'name': name}),
    );

    return jsonDecode(response.body);
  }

  static Future<List<dynamic>> getStudyGroups() async {
    final response = await http.get(Uri.parse('$baseUrl/study-groups'));
    return jsonDecode(response.body);
  }

  static Future<List<dynamic>> searchStudyGroups(String query) async {
    final response = await http.get(Uri.parse('$baseUrl/study-groups/search?query=$query'));
    return jsonDecode(response.body);
  }

  static Future<Map<String, dynamic>> createStudyGroup(String name, String description, int creatorId) async {
    final response = await http.post(
      Uri.parse('$baseUrl/study-groups'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'name': name, 'description': description, 'creatorId': creatorId}),
    );

    return jsonDecode(response.body);
  }

  static Future<String> joinStudyGroup(int studyGroupId, int userId) async {
    final response = await http.post(
      Uri.parse('$baseUrl/study-groups/$studyGroupId/join'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'userId': userId}),
    );

    return response.body;
  }

  static Future<String> leaveStudyGroup(int studyGroupId, int userId) async {
    final response = await http.post(
      Uri.parse('$baseUrl/study-groups/$studyGroupId/leave'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'userId': userId}),
    );

    return response.body;
  }

  static Future<String> markAttendance(int userId, int studyGroupId, String date, bool present) async {
    final response = await http.post(
      Uri.parse('$baseUrl/attendance'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'userId': userId,
        'studyGroupId': studyGroupId,
        'date': date,
        'present': present,
      }),
    );

    return response.body;
  }
}