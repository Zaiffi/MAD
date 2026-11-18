import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'about_screen.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  int _currentIndex = 1; // 1 for Blogs List

  final List<String> blogPosts = const [
    "The Future of Flutter Cross-Platform Apps",
    "Understanding Clean Architecture in Dart",
    "Mastering Navigation Push and Pop Flows",
    "Building Responsive ListView Builders",
    "Designing Modern GridView Card Layouts",
    "Using Custom Color Palettes Effectively",
    "State Management Best Practices",
    "Integrating Firebase Authentication",
    "Fetching Live Data from REST APIs",
    "Publishing Your App to GitHub & PlayStore",
  ];

  void _onItemTapped(int index) {
    if (index == _currentIndex) return;
    setState(() {
      _currentIndex = index;
    });

    if (index == 0) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    } else if (index == 2) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const AboutScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEEE2CB),
      appBar: AppBar(
        title: const Text("Blog Articles (10 Items)", style: TextStyle(color: Color(0xFFEEE2CB))),
        backgroundColor: const Color(0xFF1B4532),
        elevation: 0,
        iconTheme: const IconThemeData(color: Color(0xFFEEE2CB)),
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(16),
        itemCount: blogPosts.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(bottom: 14),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF1B4532).withValues(alpha: 0.04),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              leading: CircleAvatar(
                backgroundColor: const Color(0xFFEE4129), // Tomato Accent
                child: Text(
                  "${index + 1}",
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              title: Text(
                blogPosts[index],
                style: const TextStyle(color: Color(0xFF1B4532), fontWeight: FontWeight.bold, fontSize: 15),
              ),
              subtitle: const Text("Published Article", style: TextStyle(color: Colors.grey, fontSize: 12)),
              trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 14, color: Color(0xFF1B4532)),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Reading: ${blogPosts[index]}"),
                    backgroundColor: const Color(0xFFEE4129),
                    duration: const Duration(seconds: 1),
                  ),
                );
              },
            ),
          );
        },
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF1B4532),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 15,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
          child: BottomNavigationBar(
            currentIndex: _currentIndex,
            backgroundColor: const Color(0xFF1B4532),
            selectedItemColor: Colors.white, // Active white text/icon
            unselectedItemColor: Colors.white60,
            elevation: 0,
            onTap: _onItemTapped,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home_rounded), label: "Home"),
              BottomNavigationBarItem(icon: Icon(Icons.article_rounded), label: "Blogs List"),
              BottomNavigationBarItem(icon: Icon(Icons.grid_view_rounded), label: "Categories"),
            ],
          ),
        ),
      ),
    );
  }
}