class UserModel {
  final int id;
  final String name;
  final String email;

  UserModel({required this.id, required this.name, required this.email});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    print("🔍 Parsing JSON: $json"); // Optional debug
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
    );
  }
}
