import 'package:flutter/material.dart';

class UserDetailsScreen extends StatelessWidget {
  final String currentUsername;
  final String currentEmail;

  const UserDetailsScreen({
    Key? key,
    required this.currentUsername,
    required this.currentEmail,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('User Details')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Username: $currentUsername',
              style: const TextStyle(fontSize: 20),
            ),
            Text(
              'Email: $currentEmail',
              style: const TextStyle(fontSize: 20),
            ),
            // Add other details or editable fields as needed
          ],
        ),
      ),
    );
  }
}
