import 'package:dio/dio.dart';
import 'user_model.dart';

class DioClient {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: 'https://jsonplaceholder.typicode.com',
    headers: {
      'Accept': 'application/json',
      'User-Agent': 'Dart/Flutter',
    },
  ));

  Future<List<UserModel>> getUsers() async {
    try {
      print("🌐 Sending GET /users request...");
      final response = await _dio.get('/users');
      print("📥 Raw response data: ${response.data}");

      final List<UserModel> users = (response.data as List)
          .map((json) => UserModel.fromJson(json))
          .toList();

      print("✅ Parsed users: ${users.length}");
      return users;
    } catch (e) {
      print("🔥 Dio error: $e");
      rethrow;
    }
  }

}
