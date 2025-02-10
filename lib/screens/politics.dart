import 'package:flutter/material.dart';
import 'news_detail_screen.dart'; // Import the detail screen for navigation

class PoliticsScreen extends StatelessWidget {
  const PoliticsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Sample politics news data
    final List<Map<String, String>> politicsNews = [
      {
        'title': 'Election 2025 Updates',
        'description':
            'Latest trends and predictions for the upcoming elections.',
        'image':
            'https://img.freepik.com/free-photo/voting-concept-with-hand-ballot-box_23-2148701628.jpg',
        'date': 'February 10, 2025',
      },
      {
        'title': 'New Policies Announced',
        'description':
            'Government introduces reforms in education and healthcare.',
        'image':
            'https://img.freepik.com/free-photo/flat-lay-wooden-gavel-law-books_23-2148728033.jpg',
        'date': 'January 28, 2025',
      },
      {
        'title': 'Global Summit 2024',
        'description': 'World leaders discuss climate change and economy.',
        'image':
            'https://img.freepik.com/free-photo/business-meeting-negotiation-conference-discussion-concept_53876-133030.jpg',
        'date': 'December 15, 2024',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Politics News'),
        backgroundColor: Colors.redAccent, // Red accent for political theme
      ),
      body: ListView.builder(
        itemCount: politicsNews.length,
        itemBuilder: (context, index) {
          final news = politicsNews[index];
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
                                fontSize: 14, color: Colors.grey),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 6),
                          Text(
                            news['date']!,
                            style: const TextStyle(
                                fontSize: 12, color: Colors.red),
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
