import 'package:flutter/material.dart';
import 'first_page_layout.dart';
import 'chapter_names.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'JEE Study App',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: MyHomePage(),
    routes: {
      '/mathematics': (context) => SubjectPage(
            subject: 'Mathematics',
            chapters: mathematicsChapters,
            subtopics: mathematicsSubtopics,
          ),
      '/physics': (context) => SubjectPage(
            subject: 'Physics',
            chapters: physicsChapters,
            subtopics: physicsSubtopics,
          ),
      '/chemistry': (context) => SubjectPage(
            subject: 'Chemistry',
            chapters: chemistryChapters,
            subtopics: chemistrySubtopics,
          ),
    },
  ));
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {},
        ),
        title: Row(
          children: [
            const Text(
              'Syllabus',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            Spacer(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  colors: [Colors.blue, Colors.purple],
                ),
              ),
              child: Text(
                'JEE',
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            ),
            SizedBox(width: 5),
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 15,
              child: IconButton(
                icon: Icon(Icons.search, color: Colors.black, size: 18),
                onPressed: () {
                  // Handle search button press
                },
              ),
            ),
          ],
        ),
      ),
      body: FirstPageLayout(),
    );
  }
}
