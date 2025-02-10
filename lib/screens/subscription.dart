import 'package:flutter/material.dart';

class SubscriptionScreen extends StatelessWidget {
  const SubscriptionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Subscription")),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Subscription Plan Section
          _buildSubscriptionOption(
            context,
            icon: Icons.credit_card,
            title: 'Subscription Plan',
            onTap: () {
              // Navigate to Subscription Plan settings
              _showDialog(context, 'Subscription Plan Settings');
            },
          ),
          // Payment Method Section
          _buildSubscriptionOption(
            context,
            icon: Icons.payment,
            title: 'Payment Method',
            onTap: () {
              // Navigate to Payment Method settings
              _showDialog(context, 'Payment Method Settings');
            },
          ),
          // Billing Section
          _buildSubscriptionOption(
            context,
            icon: Icons.receipt,
            title: 'Billing Information',
            onTap: () {
              // Navigate to Billing Information settings
              _showDialog(context, 'Billing Information Settings');
            },
          ),
          // Subscription Status Section
          _buildSubscriptionOption(
            context,
            icon: Icons.check_circle,
            title: 'Subscription Status',
            onTap: () {
              // Navigate to Subscription Status settings
              _showDialog(context, 'Subscription Status Settings');
            },
          ),
        ],
      ),
    );
  }

  // Function to build a subscription option
  Widget _buildSubscriptionOption(
    BuildContext context, {
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue),
      title: Text(title),
      onTap: onTap,
    );
  }

  // Function to show a simple dialog with the section title
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
