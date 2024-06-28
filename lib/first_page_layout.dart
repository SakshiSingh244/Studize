import 'package:flutter/material.dart';
import 'first_circle_percentage.dart';

class FirstPageLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // First Row (1.5 : 3 ratio)
          Container(
            height: MediaQuery.of(context).size.height *
                0.3, // Adjusted height for first row
            child: Row(
              children: [
                // First Column (1 : 2 ratio with Second Column)
                Expanded(
                  flex: 1, // Takes 1 part out of 4 parts (1 + 1 + 3)
                  child: Container(
                    margin: EdgeInsets.all(8.0),
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                        colors: [
                          Color.fromARGB(255, 14, 39, 63),
                          Color.fromARGB(255, 27, 95, 178),
                        ], // Black to blackish blue gradient
                      ),
                      borderRadius: BorderRadius.circular(25.0),
                      border: Border.all(
                        color: Colors.blue, // Dark blue outline
                        width: 3.0,
                      ),
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 16.0), // Spacer for top padding
                        Text(
                          '-25 Days',
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 28.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8.0), // Spacer between texts
                        Text(
                          'Left for your Next Exam',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.0,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
                // Second Column (1 : 2 ratio with First Column)
                Expanded(
                  flex: 1, // Takes 1 part out of 4 parts (1 + 1 + 3)
                  child: Container(
                    margin: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Color(0xFF333333),
                      borderRadius:
                          BorderRadius.circular(25.0), // Circular edges
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomPaint(
                          painter: ProgressPainter(
                              progress: 0.00), // Initial 0% filled
                          child: Center(
                            child: Container(
                              width: 60,
                              height: 60,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xFF333333),
                              ),
                              child: const Center(
                                child: Text(
                                  '0.00%',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                            height: 8.0), // Spacer between circle and text
                        const Text(
                          'Syllabus completed',
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
              height: 16.0), // Spacer between first row and subjects heading
          // Subjects Heading and List
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Subjects',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 16.0), // Spacer between subjects heading and list
          // Second Row (Mathematics, Physics, Chemistry)
          Column(
            children: [
              // Mathematics Box
              _buildSubjectBox(
                subject: 'Mathematics',
                color: Colors.orange,
                useBackgroundImage: true,
                backgroundImage: 'pics/mathematics_bg.jpg',
                onPressed: () {
                  Navigator.pushNamed(context, '/mathematics');
                },
              ),
              SizedBox(height: 24.0), //spacing between boxes
              // Physics Box
              _buildSubjectBox(
                subject: 'Physics',
                color: Colors.green,
                useBackgroundImage: true,
                backgroundImage: 'pics/physics_bg.jpg',
                onPressed: () {
                  Navigator.pushNamed(context, '/physics');
                },
              ),
              SizedBox(height: 24.0), // spacing between boxes
              // Chemistry Box
              _buildSubjectBox(
                subject: 'Chemistry',
                color: Colors.blue,
                useBackgroundImage: true,
                backgroundImage: 'pics/chem_bg.jpg',
                onPressed: () {
                  Navigator.pushNamed(context, '/chemistry');
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSubjectBox({
    required String subject,
    required Color color,
    bool useBackgroundImage = false,
    String? backgroundImage,
    VoidCallback? onPressed,
  }) {
    return Container(
      height: 200.0, // height for  boxes
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20.0),
        image: useBackgroundImage && backgroundImage != null
            ? DecorationImage(
                image: AssetImage(backgroundImage),
                fit: BoxFit.cover,
              )
            : null,
      ),
      child: Stack(
        children: [
          Positioned(
            left: 16.0,
            top: 16.0,
            child: Text(
              subject,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 23.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            right: 16.0,
            top: 16.0,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(25.0),
                border: Border.all(
                  color: Colors.white,
                  width: 2.0,
                ),
              ),
              child: const Text(
                'Pending',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 30.0,
            left: 20.0, 
            right: 150.0, 
            child: LinearProgressIndicator(
              value: 0.0, // Default progress value
              backgroundColor: Colors.black.withOpacity(0.3),
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              minHeight: 8,
            ),
          ),
          Positioned(
            bottom: 20.0,
            right: 16.0,
            child: Container(
              width: 35.0,
              height: 35.0, 
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: Center(
                child: IconButton(
                  iconSize:
                      20.0, 
                  icon: Icon(Icons.arrow_forward),
                  color: Colors.black,
                  onPressed: onPressed,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
