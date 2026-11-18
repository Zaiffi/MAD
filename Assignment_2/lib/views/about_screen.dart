import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'list_screen.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  int _currentIndex = 2; // 2 for Categories

  final List gridCategories = const [
    {"title": "Technology", "subtitle": "App & Code"},
    {"title": "UI / UX", "subtitle": "Design Systems"},
    {"title": "Lifestyle", "subtitle": "Daily Routine"},
    {"title": "Tutorials", "subtitle": "Step-by-Step"},
    {"title": "Reviews", "subtitle": "Product Insights"},
    {"title": "Updates", "subtitle": "News & Events"},
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
    } else if (index == 1) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const ListScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEEE2CB),
      appBar: AppBar(
        title: const Text("Blog Categories (6 Grid)", style: TextStyle(color: Color(0xFFEEE2CB))),
        backgroundColor: const Color(0xFF1B4532),
        elevation: 0,
        iconTheme: const IconThemeData(color: Color(0xFFEEE2CB)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: gridCategories.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 1.1,
          ),
          itemBuilder: (context, index) {
            final item = gridCategories[index];
            return Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF1B4532).withValues(alpha: 0.05),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEEE2CB),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: const Icon(Icons.category_rounded, size: 26, color: Color(0xFFEE4129)),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    item["title"]!,
                    style: const TextStyle(
                      color: Color(0xFF1B4532),
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    item["subtitle"]!,
                    style: const TextStyle(color: Colors.grey, fontSize: 11),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          },
        ),
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