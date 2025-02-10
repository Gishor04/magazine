import 'package:flutter/material.dart';
import 'news_detail_screen.dart'; // Import the detail screen for navigation

class IllegalNewsScreen extends StatelessWidget {
  const IllegalNewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> illegalNews = [
      {
        'title': 'Cybercrime Rising',
        'description': 'Experts warn of increased cyberattacks worldwide.',
        'image':
            'https://img.freepik.com/free-photo/hacker-cracking-binary-code-with-laptop_53876-100019.jpg',
        'date': 'March 5, 2025',
      },
      {
        'title': 'Drug Trafficking Case',
        'description': 'Authorities seize record amounts in global operation.',
        'image':
            'https://img.freepik.com/free-photo/police-operation-with-drug_23-2148097567.jpg',
        'date': 'February 22, 2025',
      },
      {
        'title': 'Illegal Wildlife Trade',
        'description': 'Endangered species threatened by black market demand.',
        'image':
            'https://img.freepik.com/free-photo/stop-animal-trade-banner_23-2149490195.jpg',
        'date': 'January 10, 2025',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Illegal News'),
        backgroundColor: Colors.black87, // Dark theme for "Illegal News"
      ),
      body: ListView.builder(
        itemCount: illegalNews.length,
        itemBuilder: (context, index) {
          final news = illegalNews[index];
          return GestureDetector(
            onTap: () {
              // Navigate to the detail screen
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NewsDetailScreen(news: news),
                ),
              );
            },
            child: Card(
              margin:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              elevation: 4, // Shadow effect
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    // News Image
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        news['image']!,
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(Icons.broken_image, size: 80);
                        },
                      ),
                    ),
                    const SizedBox(width: 12), // Space between image and text

                    // News Details
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            news['title']!,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            news['description']!,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 6),
                          Text(
                            news['date']!,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
