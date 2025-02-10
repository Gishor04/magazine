import 'package:flutter/material.dart';
import 'news_detail_screen.dart'; // Import the new screen for detailed view

class EducationScreen extends StatelessWidget {
  const EducationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Sample education news data
    final List<Map<String, String>> educationNews = [
      {
        'title': 'New Research in AI',
        'description': 'A breakthrough in artificial intelligence.',
        'image':
            'https://img.freepik.com/free-photo/still-life-business-concept_23-2149155670.jpg',
        'date': 'January 25, 2025',
      },
      {
        'title': 'Online Learning Growth',
        'description': 'More students are choosing online education.',
        'image':
            'https://img.freepik.com/free-photo/e-learning-classroom-digital-tools_53876-97908.jpg',
        'date': 'December 10, 2024',
      },
      {
        'title': 'Science Fair 2024',
        'description': 'Top young scientists showcase their innovations.',
        'image':
            'https://img.freepik.com/free-photo/students-working-lab-together_23-2149051994.jpg',
        'date': 'November 5, 2024',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Education News'),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: educationNews.length,
        itemBuilder: (context, index) {
          final news = educationNews[index];
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
                              color: Colors.blue,
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
