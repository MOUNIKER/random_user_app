class UserModel {
  final String name;
  final String email;
  final String imageUrl;

  UserModel({required this.name, required this.email, required this.imageUrl});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    final name =  json['name']['first'] + ' ' + json['name']['last'];
    final email = json['email'];
    final imageUrl = json['picture']['large'];
    return UserModel(name: name, email: email, imageUrl: imageUrl);
  }
}
