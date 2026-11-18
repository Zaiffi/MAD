import 'package:flutter/material.dart';
import 'list_screen.dart';
import 'about_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  void _onItemTapped(int index) {
    if (index == _currentIndex) return;
    setState(() {
      _currentIndex = index;
    });

    if (index == 1) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const ListScreen()),
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
      backgroundColor: const Color(0xFFEEE2CB), // 60% Cream
      appBar: AppBar(
        title: const Text(
          "InkSpire Home",
          style: TextStyle(color: Color(0xFFEEE2CB), fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF1B4532), // 30% Spruce Velvet
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Color(0xFFEEE2CB)),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Blog Purpose Banner
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: const Color(0xFF1B4532),
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF1B4532).withValues(alpha: 0.2),
                    blurRadius: 15,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEE4129), // 10% Tomato Accent
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      "WELCOME TO BLOG HUB",
                      style: TextStyle(color: Color(0xFFEEE2CB), fontSize: 10, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "Discover Ideas & Stories",
                    style: TextStyle(color: Color(0xFFEEE2CB), fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Our platform brings you insightful articles on technology, design, and lifestyle, crafted by expert writers.",
                    style: TextStyle(color: Colors.white70, fontSize: 13, height: 1.4),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 28),

            const Text(
              "Explore Sections",
              style: TextStyle(color: Color(0xFF1B4532), fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            // Quick Navigation Cards
            Row(
              children: [
                Expanded(
                  child: _buildNavCard(
                    title: "Articles List",
                    subtitle: "10 Blog Posts",
                    icon: Icons.article_rounded,
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const ListScreen()));
                    },
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildNavCard(
                    title: "Categories",
                    subtitle: "6 Grid Topics",
                    icon: Icons.grid_view_rounded,
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const AboutScreen()));
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      // Bottom Navigation Bar with Top Border Radius & Active White Focus
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
            selectedItemColor: Colors.white, // Active link is Pure White
            unselectedItemColor: Colors.white60, // Inactive links are light
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

  Widget _buildNavCard({required String title, required String subtitle, required IconData icon, required VoidCallback onTap}) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      elevation: 2,
      shadowColor: const Color(0xFF1B4532).withValues(alpha: 0.1),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFFEEE2CB),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(icon, color: const Color(0xFFEE4129), size: 26),
              ),
              const SizedBox(height: 20),
              Text(
                title,
                style: const TextStyle(color: Color(0xFF1B4532), fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: const TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }
}