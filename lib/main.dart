import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'example1_dio/dio_example_screen.dart';
// or
import 'example2_retrofit/retrofit_example_screen.dart';

void main() {
  testDio();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,

    //home: DioExampleScreen(),
    // or
    home: RetrofitExampleScreen(),
  ));

}
void testDio() async {
  final dio = Dio();
  final response = await dio.get("https://jsonplaceholder.typicode.com/users");
  print("Raw response: ${response.data}");
}

