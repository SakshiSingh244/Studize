// subtopics_page.dart

import 'package:flutter/material.dart';

class SubtopicsPage extends StatefulWidget {
  final String chapterName;
  final List<String> subtopics;

  SubtopicsPage({required this.chapterName, required this.subtopics});

  @override
  _SubtopicsPageState createState() => _SubtopicsPageState();
}

class _SubtopicsPageState extends State<SubtopicsPage> {
  late List<bool> toggleStates;

  @override
  void initState() {
    super.initState();
    toggleStates = List<bool>.filled(widget.subtopics.length, false);
  }

  void toggleSubtopic(int index) {
    setState(() {
      toggleStates[index] = !toggleStates[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          widget.chapterName,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        color: Colors.black,
        child: ListView.builder(
          itemCount: widget.subtopics.length,
          itemBuilder: (context, index) {
            bool isToggled = toggleStates[index];
            return Container(
              margin: EdgeInsets.symmetric(vertical: 9.0, horizontal: 16.0),
              decoration: BoxDecoration(
                color: Color(0xFF333333),
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: ListTile(
                  title: Row(
                    children: [
                      Text(
                        '${index + 1}.         ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.0,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          widget.subtopics[index],
                          style: TextStyle(
                            color: isToggled ? Colors.green : Colors.white,
                            fontSize: 15.0,
                            decoration: isToggled
                                ? TextDecoration.lineThrough
                                : TextDecoration.none,
                            decorationColor: Colors.green,
                          ),
                        ),
                      ),
                      _buildSlidingButton(index, isToggled),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildSlidingButton(int index, bool isToggled) {
    return GestureDetector(
      onTap: () {
        toggleSubtopic(index);
      },
      child: Container(
        width: 55.0,
        height: 30.0,
        decoration: BoxDecoration(
          color: isToggled ? Colors.blue : Colors.grey[300],
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              left: isToggled ? 25.0 : 0.0,
              child: Container(
                width: 30.0,
                height: 30.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
