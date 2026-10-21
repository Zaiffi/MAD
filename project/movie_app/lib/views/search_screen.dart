import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController searchController = TextEditingController();
  int selectedFilterIndex = 0;

  final List<String> filters = ["All", "Action", "Drama", "Sci-Fi", "Animation", "Horror"];

  // Dummy movie list
  final List<Map<String, String>> dummyMovies = [
    {"title": "Inception", "genre": "Sci-Fi", "rating": "8.8", "year": "2010"},
    {"title": "The Dark Knight", "genre": "Action", "rating": "9.0", "year": "2008"},
    {"title": "Interstellar", "genre": "Sci-Fi", "rating": "8.7", "year": "2014"},
    {"title": "Avengers: Endgame", "genre": "Action", "rating": "8.4", "year": "2019"},
    {"title": "Joker", "genre": "Drama", "rating": "8.4", "year": "2019"},
    {"title": "Spider-Man: Across the Spider-Verse", "genre": "Animation", "rating": "8.7", "year": "2023"},
  ];

  @override
  Widget build(BuildContext context) {
    String searchQuery = searchController.text.toLowerCase().trim();
    String selectedCategory = filters[selectedFilterIndex];

    // Filtering logic based on Search Query and Selected Genre Filter
    List<Map<String, String>> filteredMovies = dummyMovies.where((movie) {
      bool matchesSearch = movie["title"]!.toLowerCase().contains(searchQuery) ||
          movie["genre"]!.toLowerCase().contains(searchQuery);

      bool matchesCategory = selectedCategory == "All" || movie["genre"] == selectedCategory;

      return matchesSearch && matchesCategory;
    }).toList();

    return Scaffold(
      backgroundColor: const Color(0xFF171725),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Screen Title
              const Text(
                "Search Movies",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 15),

              // Search Input Bar
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF1F1D2B),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: TextField(
                  controller: searchController,
                  style: const TextStyle(color: Colors.white),
                  onChanged: (value) {
                    setState(() {}); // Refresh UI as user types to filter results
                  },
                  decoration: InputDecoration(
                    hintText: "Search title, genre, actor...",
                    hintStyle: TextStyle(color: Colors.white.withValues(alpha: 0.5)),
                    prefixIcon: const Icon(Icons.search, color: Color(0xFFE50914)),
                    suffixIcon: searchController.text.isNotEmpty
                        ? IconButton(
                      icon: const Icon(Icons.clear, color: Colors.grey),
                      onPressed: () {
                        setState(() {
                          searchController.clear();
                        });
                      },
                    )
                        : null,
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Filter Chips
              SizedBox(
                height: 38,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: filters.length,
                  itemBuilder: (context, index) {
                    bool isSelected = selectedFilterIndex == index;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedFilterIndex = index;
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.only(right: 10),
                        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                        decoration: BoxDecoration(
                          color: isSelected ? const Color(0xFFE50914) : const Color(0xFF1F1D2B),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          filters[index],
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.white.withValues(alpha: 0.6),
                            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 20),

              // Results Count / Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Result Movies",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "${filteredMovies.length} Found",
                    style: TextStyle(color: Colors.white.withValues(alpha: 0.5), fontSize: 12),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              // Movies Grid View or Empty State
              filteredMovies.isEmpty
                  ? Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.search_off_rounded, size: 60, color: Colors.white24),
                      const SizedBox(height: 10),
                      const Text(
                        "No Movies Found",
                        style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "Try searching with another keyword or genre.",
                        style: TextStyle(color: Colors.white.withValues(alpha: 0.5), fontSize: 13),
                      ),
                    ],
                  ),
                ),
              )
                  : Expanded(
                child: GridView.builder(
                  itemCount: filteredMovies.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                    childAspectRatio: 0.68,
                  ),
                  itemBuilder: (context, index) {
                    final movie = filteredMovies[index];
                    return Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFF1F1D2B),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Movie Poster Placeholder
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.grey.shade800,
                                borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                              ),
                              child: const Center(
                                child: Icon(Icons.movie_rounded, size: 50, color: Colors.white24),
                              ),
                            ),
                          ),
                          // Movie Info
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  movie["title"]!,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      movie["genre"]!,
                                      style: TextStyle(
                                        color: Colors.white.withValues(alpha: 0.5),
                                        fontSize: 12,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        const Icon(Icons.star, color: Colors.amber, size: 13),
                                        const SizedBox(width: 3),
                                        Text(
                                          movie["rating"]!,
                                          style: const TextStyle(color: Colors.white, fontSize: 12),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}