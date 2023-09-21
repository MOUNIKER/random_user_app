import 'package:flutter/material.dart';
import 'package:random_user_app/api_service.dart';
import 'package:random_user_app/user_detail_screen.dart';
import 'package:random_user_app/user_model.dart';

class UserListScreen extends StatefulWidget {
  const UserListScreen({super.key});

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  final ApiService _apiService = ApiService();
  late Future<List<UserModel>> _userList;

  @override
  void initState() {
    super.initState();
    _userList = _apiService.getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User List'),
      ),
      body: FutureBuilder<List<UserModel>>(
        future: _userList,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            final userList = snapshot.data;
            return ListView.builder(
              itemCount: userList!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(userList[index].name),
                  subtitle: Text(userList[index].email),
                  trailing: IconButton.outlined(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UserDetailScreen(
                            user: userList[index],
                          ),
                        ),
                      );
                    },
                    icon: const Icon(Icons.arrow_forward_ios_outlined),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
