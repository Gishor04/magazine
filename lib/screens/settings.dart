import 'package:flutter/material.dart';
import 'package:flutters/screens/user_details.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Settings")),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          ListTile(
            leading: const Icon(Icons.account_circle, color: Colors.blue),
            title: const Text('Username & Email'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UserDetailsScreen(
                    currentUsername: 'Rajendra Gishor',
                    currentEmail: 'gishor@example.com',
                  ),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.lock, color: Colors.blue),
            title: const Text('Privacy & Security'),
            onTap: () {
              _showDialog(context, 'Privacy & Security Settings');
            },
          ),
          ListTile(
            leading: const Icon(Icons.notifications, color: Colors.blue),
            title: const Text('Notifications'),
            onTap: () {
              _showDialog(context, 'Notifications Settings');
            },
          ),
        ],
      ),
    );
  }

  void _showDialog(BuildContext context, String sectionTitle) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(sectionTitle),
        content: Text('This is where you can manage $sectionTitle.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
