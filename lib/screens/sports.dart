import 'package:flutter/material.dart';
import 'news_detail_screen.dart'; // Import the new screen

class SportScreen extends StatelessWidget {
  const SportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Sample sports news data
    final List<Map<String, String>> sportsNews = [
      {
        'title': 'Champions League Final',
        'description': 'Exciting match between top teams.',
        'image':
            'https://img.freepik.com/free-photo/sports-tools_53876-138077.jpg', // Fixed image URL
        'date': 'January 30, 2025',
      },
      {
        'title': 'Olympic Games 2024',
        'description': 'Athletes from all over the world competing.',
        'image':
            'https://img.freepik.com/free-photo/various-sports-tools_53876-138078.jpg',
        'date': 'July 26, 2024',
      },
      {
        'title': 'Cricket World Cup',
        'description': 'The biggest cricket tournament is here!',
        'image':
            'https://img.freepik.com/free-photo/collection-sports-tools_53876-138079.jpg',
        'date': 'November 15, 2024',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sports News'),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: sportsNews.length,
        itemBuilder: (context, index) {
          final news = sportsNews[index];
          return GestureDetector(
            onTap: () {
              // Navigate to the details screen
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
                                fontSize: 14, color: Colors.grey),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 6),
                          Text(
                            news['date']!,
                            style: const TextStyle(
                                fontSize: 12, color: Colors.blue),
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
