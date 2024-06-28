import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'sliding_button.dart';
import 'subtopics.dart';

class ChapterList extends StatefulWidget {
  final String subject;
  final List<String> chapters;
  final List<List<String>> subtopics;

  const ChapterList({
    required this.subject,
    required this.chapters,
    required this.subtopics,
  });

  @override
  _ChapterListState createState() => _ChapterListState();
}

class _ChapterListState extends State<ChapterList> {
  late List<List<bool>> switchStates;

  @override
  void initState() {
    super.initState();
    switchStates = List.generate(
      widget.chapters.length,
      (index) => List.generate(4, (index) => false),
    );
  }

  void toggleSwitch(int chapterIndex, int rowIndex) {
    setState(() {
      switchStates[chapterIndex][rowIndex] =
          !switchStates[chapterIndex][rowIndex];
    });
  }

  bool areAllSwitchesOn(int index) {
    return switchStates[index].every((element) => element);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          widget.subject,
          style: const TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        color: Colors.black,
        child: Theme(
          data: ThemeData(
            iconTheme: const IconThemeData(color: Colors.white),
            dividerColor: Colors.transparent,
            dividerTheme: DividerThemeData(
              thickness: 0,
              space: 0,
            ),
            cupertinoOverrideTheme: const CupertinoThemeData(
              scaffoldBackgroundColor: Colors.black,
            ),
          ),
          child: ListView.builder(
            itemCount: widget.chapters.length,
            itemBuilder: (BuildContext context, int index) {
              bool allOn = areAllSwitchesOn(index);
              return Container(
                margin: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 16.0),
                decoration: BoxDecoration(
                  color: const Color(0xFF333333),
                  borderRadius: BorderRadius.circular(40.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Theme(
                    data: Theme.of(context).copyWith(
                      dividerColor: Colors.transparent,
                    ),
                    child: ExpansionTile(
                      trailing: const Icon(
                        Icons.keyboard_arrow_down_outlined,
                        color: Colors.white,
                      ),
                      title: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${index + 1}. ',
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                            ),
                          ),
                          const SizedBox(width: 20.0),
                          Expanded(
                            child: Text(
                              widget.chapters[index].toUpperCase(),
                              style: TextStyle(
                                color: allOn ? Colors.green : Colors.white,
                                fontSize: 14,
                                decoration: allOn
                                    ? TextDecoration.lineThrough
                                    : TextDecoration.none,
                                decorationColor: Colors.green,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                      childrenPadding: EdgeInsets.zero,
                      children: [
                        Container(
                          padding: EdgeInsets.all(20.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildRow("Lectures", index, 0),
                              SizedBox(height: 20.0),
                              _buildRow("Notes", index, 1),
                              SizedBox(height: 20.0),
                              _buildRow("Questions", index, 2),
                              SizedBox(height: 20.0),
                              _buildRow("Text", index, 3),
                              SizedBox(height: 25.0),
                              Center(
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => SubtopicsPage(
                                          chapterName: widget.chapters[index],
                                          subtopics: widget.subtopics[index],
                                        ),
                                      ),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blue,
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 70.0,
                                      vertical: 15.0,
                                    ),
                                  ),
                                  child: Text(
                                    'Check Subtopics',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.0,
                                    ),
                                  ),
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
        ),
      ),
    );
  }

  Widget _buildRow(String label, int chapterIndex, int rowIndex) {
    return Row(
      children: [
        Expanded(
          child: Text(
            label,
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          ),
        ),
        SizedBox(width: 16.0),
        SlidingButton(
          isOn: switchStates[chapterIndex][rowIndex],
          onToggle: () {
            toggleSwitch(chapterIndex, rowIndex);
          },
        ),
      ],
    );
  }
}
