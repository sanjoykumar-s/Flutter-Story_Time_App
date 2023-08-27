import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import './Stories.dart';

void main() {
  runApp(const PictureStoryApp());
}

class PictureStoryApp extends StatelessWidget {
  const PictureStoryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Picture Story Time',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const StoryLibraryScreen(),
    );
  }
}

class StoryLibraryScreen extends StatelessWidget {
  const StoryLibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Story Library'),
      ),
      body: ListView.builder(
        itemCount: storyList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // Navigate to the story viewer screen
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      StoryViewerScreen(story: storyList[index]),
                ),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Image.asset(
                    storyList[index].coverImage,
                    width: 70,
                    height: 70,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(width: 16.0),
                  Text(
                    storyList[index].title,
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class StoryViewerScreen extends StatelessWidget {
  final Story story;
  FlutterTts flutterTts = FlutterTts();
  void _speak(String text) async {
    await flutterTts.setLanguage('en-us');
    await flutterTts.speak(text);
  }

  StoryViewerScreen({super.key, required this.story});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(story.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              story.coverImage,
              width: double.infinity,
              height: 300,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                story.content,
                style: const TextStyle(fontSize: 16),
              ),
            ),
            ElevatedButton(
              child: const Text('Read Aloud'),
              onPressed: () => _speak(story.content),
            ),
          ],
        ),
      ),
    );
  }
}

// class Story {
//   final String title;
//   final String coverImage;
//   final String content;

//   Story({required this.title, required this.coverImage, required this.content});
// }

// Stories stories = Stories();
// // Dummy data
// List<Story> storyList = [
//   Story(
//     title: 'The Adventure of Alex',
//     coverImage: 'assets/images/sanjoy.jpg',
//     content: stories.str,
//   ),
//   Story(
//     title: 'Hello',
//     coverImage: 'assets/images/Sanjoy.jpg',
//     content: 'Once upon a time ,There ...',
//   ),
//   // Add more stories here
// ];
