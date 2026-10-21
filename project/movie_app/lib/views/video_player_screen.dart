import 'package:flutter/material.dart';

class VideoPlayerScreen extends StatefulWidget {
  final String movieTitle;

  const VideoPlayerScreen({super.key, required this.movieTitle});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  bool isPlaying = true;
  double currentProgress = 35.0; // Dummy progress percentage

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Simulated Video Background (Jab actual video player lagayenge toh yahan video render hogi)
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.movie_creation_outlined, size: 80, color: Colors.white24),
                const SizedBox(height: 15),
                Text(
                  "Streaming: ${widget.movieTitle}",
                  style: const TextStyle(color: Colors.white54, fontSize: 16),
                ),
              ],
            ),
          ),

          // Video Controls Overlay
          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Top Bar (Back Button & Movie Title)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
                        onPressed: () => Navigator.pop(context),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          widget.movieTitle,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.settings_outlined, color: Colors.white),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),

                // Center Play/Pause Control Button
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      iconSize: 50,
                      icon: const Icon(Icons.replay_10_rounded, color: Colors.white),
                      onPressed: () {},
                    ),
                    const SizedBox(width: 40),
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFE50914),
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        iconSize: 50,
                        icon: Icon(
                          isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            isPlaying = !isPlaying;
                          });
                        },
                      ),
                    ),
                    const SizedBox(width: 40),
                    IconButton(
                      iconSize: 50,
                      icon: const Icon(Icons.forward_10_rounded, color: Colors.white),
                      onPressed: () {},
                    ),
                  ],
                ),

                // Bottom Controls (Seek Bar & Timers)
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text("01:15:20", style: TextStyle(color: Colors.white70, fontSize: 12)),
                          Text("02:15:00", style: TextStyle(color: Colors.white70, fontSize: 12)),
                        ],
                      ),
                      Slider(
                        value: currentProgress,
                        min: 0,
                        max: 100,
                        activeColor: const Color(0xFFE50914),
                        inactiveColor: Colors.white24,
                        onChanged: (value) {
                          setState(() {
                            currentProgress = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}