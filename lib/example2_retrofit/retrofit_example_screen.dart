import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'api_service.dart';
import 'comment.dart'; // Use comment model

class RetrofitExampleScreen extends StatefulWidget {
  @override
  _RetrofitExampleScreenState createState() => _RetrofitExampleScreenState();
}

class _RetrofitExampleScreenState extends State<RetrofitExampleScreen> {
  late ApiService apiService;
  List<Comment> comments = [];

  @override
  void initState() {
    super.initState();

    final dio = Dio(
      BaseOptions(
        headers: {
          'Accept': 'application/json',
        },
      ),
    );

    apiService = ApiService(dio);
    loadData();
  }

  void loadData() async {
    try {
      final result = await apiService.getComments(1);
      print("Data: $result");

      setState(() {
        comments = result;
      });
    } catch (e) {
      print("Something went wrong: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Retrofit Example")),
      body: comments.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: comments.length,
        itemBuilder: (_, index) => ListTile(
          title: Text(comments[index].name),
          subtitle: Text(comments[index].email),
        ),
      ),
    );
  }
}
