import 'package:flutter/material.dart';
import 'chap_layout.dart';
import 'first_page_layout.dart';

void main() {
  runApp(MaterialApp(
    home: FirstPageLayout(), // Set the home property to FirstPageLayout
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

class SubjectPage extends StatefulWidget {
  final String subject;
  final List<String> chapters;
  final List<List<String>> subtopics;

  const SubjectPage({
    Key? key,
    required this.subject,
    required this.chapters,
    required this.subtopics,
  }) : super(key: key);

  @override
  _SubjectPageState createState() => _SubjectPageState();
}

class _SubjectPageState extends State<SubjectPage> {
  @override
  Widget build(BuildContext context) {
    return ChapterList(
      subject: widget.subject,
      chapters: widget.chapters,
      subtopics: widget.subtopics,
    );
  }
}

// Mathematics data
final List<String> mathematicsChapters = [
  'Sets',
  'Relations and Functions',
  'Trigonometric Functions',
  'Principle of Mathematical Induction',
  'Complex Numbers and Quadratic Equations',
  'Linear Inequalities',
  'Permutations and Combinations',
  'Binomial Theorem',
  'Sequences and Series',
  'Straight Lines',
  'Conic Sections',
  'Introduction to Three Dimensional Geometry',
  'Limits and Derivatives',
  'Mathematical Reasoning',
  'Statistics',
  'Probability',
];

final List<List<String>> mathematicsSubtopics = [
  [
    'Introduction to Sets',
    'Types of Sets',
    'Operations on Sets',
    'Venn Diagrams'
  ],
  [
    'Types of Relations',
    'Functions and Their Types',
    'Composition of Functions',
    'Invertible Functions'
  ],
  [
    'Introduction to Trigonometry',
    'Trigonometric Ratios',
    'Trigonometric Identities',
    'Graphs of Trigonometric Functions'
  ],
  [
    'Understanding Induction',
    'Steps in Induction',
    'Examples of Induction',
    'Strong Induction'
  ],
  [
    'Introduction to Complex Numbers',
    'Operations on Complex Numbers',
    'Quadratic Equations and Roots',
    'Complex Plane and Geometry'
  ],
  [
    'Graphing Linear Inequalities',
    'Solving Linear Inequalities',
    'Systems of Linear Inequalities',
    'Applications of Linear Inequalities'
  ],
  [
    'Permutations',
    'Combinations',
    'Factorial Notation',
    'Applications in Probability'
  ],
  [
    'Expansion of Binomials',
    'Binomial Coefficients',
    'Applications in Probability',
    'Pascal\'s Triangle'
  ],
  [
    'Arithmetic Sequences',
    'Geometric Sequences',
    'Summation of Series',
    'Infinite Series'
  ],
  [
    'Equation of a Line',
    'Slope and Intercept Form',
    'Distance and Midpoint Formula',
    'Parallel and Perpendicular Lines'
  ],
  ['Circle', 'Parabola', 'Ellipse', 'Hyperbola'],
  [
    'Coordinates in 3D',
    'Distance between Points',
    'Equation of a Plane',
    'Intersection of Planes'
  ],
  [
    'Understanding Limits',
    'Properties of Limits',
    'Derivatives and Rules',
    'Applications of Derivatives'
  ],
  [
    'Statements and Connectives',
    'Logical Equivalence',
    'Arguments and Validity',
    'Methods of Proof'
  ],
  [
    'Measures of Central Tendency',
    'Measures of Dispersion',
    'Probability Distributions',
    'Statistical Sampling'
  ],
  [
    'Fundamentals of Probability',
    'Conditional Probability',
    'Probability Distributions',
    'Random Variables'
  ],
];

// Chemistry data
final List<String> chemistryChapters = [
  'Atomic Structure',
  'Chemical Bonding',
  'States of Matter',
  'Chemical Thermodynamics',
  'Electrochemistry',
  'Chemical Kinetics',
  'Surface Chemistry',
  'Coordination Compounds',
  'Organic Chemistry',
  'Polymers',
  'Biomolecules',
  'Chemistry in Everyday Life',
];

final List<List<String>> chemistrySubtopics = [
  ['Bohr\'s Model of the Atom', 'Quantum Numbers', 'Electron Configuration'],
  ['Ionic Bonding', 'Covalent Bonding', 'Metallic Bonding'],
  ['Solid State', 'Liquid State', 'Gaseous State'],
  ['Laws of Thermodynamics', 'Enthalpy and Entropy', 'Gibbs Free Energy'],
  [
    'Electrochemical Cells',
    'Faraday\'s Laws of Electrolysis',
    'Nernst Equation'
  ],
  ['Rate Laws', 'Activation Energy', 'Reaction Mechanisms'],
  ['Adsorption', 'Catalysis', 'Surface Tension'],
  ['Ligands and Complex Ions', 'Isomerism in Coordination Compounds'],
  ['Hydrocarbons', 'Functional Groups', 'Organic Reaction Mechanisms'],
  ['Polymerization Reactions', 'Types of Polymers', 'Properties of Polymers'],
  ['Proteins', 'Carbohydrates', 'Lipids'],
  ['Drugs and Medicines', 'Food Additives', 'Cleaning Agents'],
];

// Physics data
final List<String> physicsChapters = [
  'Mechanics',
  'Thermodynamics',
  'Electromagnetism',
  'Optics',
  'Modern Physics',
  'Nuclear Physics',
];

final List<List<String>> physicsSubtopics = [
  ['Kinematics', 'Dynamics', 'Work and Energy'],
  ['Heat', 'Laws of Thermodynamics', 'Thermal Properties'],
  ['Electric Fields', 'Magnetic Fields', 'Electromagnetic Waves'],
  ['Reflection', 'Refraction', 'Diffraction'],
  ['Relativity', 'Quantum Mechanics', 'Atomic Structure'],
  ['Radioactivity', 'Nuclear Reactions', 'Nuclear Energy'],
];
