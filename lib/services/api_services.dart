import 'dart:convert'; // Import the dart:convert package
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_/models/sugession.dart';
// Correct the typo in 'sugession.dart'

final apiServiceProvider =
    Provider((ref) => ApiService()); // Correct the typo in 'ApiServise'

class ApiService {
  final dio = Dio();

  Future<Suggestion> getSuggestion() async {
    try {
      final response = await dio.get('https://www.boredapi.com/api/activity/');
      return Suggestion.fromJson((response.data));
    } catch (e) {
      throw Exception('Error Getting suggestion');
    }
  }
}
