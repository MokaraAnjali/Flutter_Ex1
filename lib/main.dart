import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const StudentGradeBook(),
    );
  }
}

class StudentGradeBook extends StatelessWidget {
  const StudentGradeBook({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text("Student Grade Book"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Welcome! View your Grades below 👇",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            // Search Bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: "Search subject or semester...",
                  border: InputBorder.none,
                  icon: Icon(Icons.search),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Banner Image
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                "https://cdn-icons-png.flaticon.com/512/3135/3135755.png",
                height: 160,
                width: double.infinity,
                fit: BoxFit.contain,
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              "Your Subjects & Grades",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            // Subject cards
            SubjectCard(
              subject: "Mathematics",
              image:
                  "https://cdn-icons-png.flaticon.com/512/2906/2906274.png",
              grades: const ["A", "B+", "A-"],
            ),
            SubjectCard(
              subject: "Computer Science",
              image:
                  "https://cdn-icons-png.flaticon.com/512/2721/2721299.png",
              grades: const ["A+", "A", "A+"],
            ),
            SubjectCard(
              subject: "Physics",
              image:
                  "https://cdn-icons-png.flaticon.com/512/1995/1995574.png",
              grades: const ["B+", "A", "A-"],
            ),
            SubjectCard(
              subject: "English",
              image:
                  "https://cdn-icons-png.flaticon.com/512/3135/3135810.png",
              grades: const ["A", "A-", "B+"],
            ),

            const SizedBox(height: 20),

            // Footer
            Center(
              child: Text(
                "© ${DateTime.now().year} Student Grade Book App",
                style: const TextStyle(color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Subject card widget
class SubjectCard extends StatelessWidget {
  final String subject;
  final String image;
  final List<String> grades;

  const SubjectCard({
    super.key,
    required this.subject,
    required this.image,
    required this.grades,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              children: [
                Image.network(image, height: 60, width: 60),
                const SizedBox(width: 12),
                Text(
                  subject,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: grades.map((g) => GradeBox(g)).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

// Reusable GradeBox widget
class GradeBox extends StatelessWidget {
  final String grade;
  const GradeBox(this.grade, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.teal.shade50,
        border: Border.all(color: Colors.teal),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        grade,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
    );
  }
}
