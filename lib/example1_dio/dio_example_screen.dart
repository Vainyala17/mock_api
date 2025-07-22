import 'package:flutter/material.dart';
import 'dio_client.dart';
import 'user_model.dart';

class DioExampleScreen extends StatefulWidget {
  @override
  _DioExampleScreenState createState() => _DioExampleScreenState();
}

class _DioExampleScreenState extends State<DioExampleScreen> {
  List<UserModel> users = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  void fetchUsers() async {
    print("📡 Step 1: Started fetching users...");
    try {
      final data = await DioClient().getUsers();
      print("✅ Step 2: Users fetched successfully - Count: ${data.length}");
      setState(() {
        users = data;
        isLoading = false;
      });
    } catch (e) {
      print("❌ Step 3: Error occurred: $e");
      setState(() => isLoading = false);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Dio Example")),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : users.isEmpty
          ? Center(child: Text("⚠️ No users found or error occurred."))
          : ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          return ListTile(
            title: Text(user.name),
            subtitle: Text(user.email),
          );
        },
      ),
    );
  }
}