import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'comment.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: "https://jsonplaceholder.typicode.com")
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET("/comments")
  Future<List<Comment>> getComments(@Query("postId") int postId);
}