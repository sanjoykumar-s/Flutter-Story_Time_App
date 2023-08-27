import 'AllStories/Story.dart';
class Story {
  final String title;
  final String coverImage;
  final String content;

  Story({required this.title, required this.coverImage, required this.content});
}

// Dummy data
List<Story> storyList = [
  Story(
    title: 'The Story of Elon Musk',
    coverImage: 'assets/images/Elon_Musk.jpg',
    content: storyOfElonMask,
  ),
  Story(
    title: 'Story of a Bad Boy',
    coverImage: 'assets/images/Sanjoy.jpg',
    content: storyOfSanjoy,
  ),
  // Add more stories here
];