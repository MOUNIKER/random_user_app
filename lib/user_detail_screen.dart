import 'package:flutter/material.dart';
import 'package:random_user_app/user_model.dart';
import 'package:cached_network_image/cached_network_image.dart';

class UserDetailScreen extends StatelessWidget {
  final UserModel user;

  const UserDetailScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Details'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CachedNetworkImage(
              imageUrl: user.imageUrl,
              placeholder: (context, url) =>const CircularProgressIndicator(),
            ),
            const SizedBox(height: 20.0),
            Text(
              user.name,
              style:const TextStyle(fontSize: 24.0),
            ),
          ],
        ),
      ),
    );
  }
}
