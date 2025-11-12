import 'package:flutter/material.dart';
import '../models/exam.dart';
import '../widgets/exam_card.dart';
import 'exam_detail_screen.dart';

class ExamListScreen extends StatelessWidget {
  final String studentIndex = "212059";

  final List<Exam> exams = [
    Exam(subjectName: "Математика 1", dateTime: DateTime(2025, 1, 15, 9, 0), rooms: ["Lab 215", "Lab 200AB"]),
    Exam(subjectName: "Програмирање", dateTime: DateTime(2025, 1, 17, 12, 0), rooms: ["Lab1"]),
    Exam(subjectName: "Бази на податоци", dateTime: DateTime(2026, 1, 20, 10, 0), rooms: ["B2.2"]),
    Exam(subjectName: "Компјутерски мрежи", dateTime: DateTime(2025, 1, 22, 13, 0), rooms: ["B3.2"]),
    Exam(subjectName: "Оперативни системи", dateTime: DateTime(2025, 1, 25, 9, 30), rooms: ["138"]),
    Exam(subjectName: "Информациски системи", dateTime: DateTime(2025, 1, 27, 11, 0), rooms: ["117"]),
    Exam(subjectName: "Алгоритми и структури на податоци", dateTime: DateTime(2025, 1, 29, 8, 0), rooms: ["215"]),
    Exam(subjectName: "Вештачка интелигенција", dateTime: DateTime(2025, 11, 18, 10, 0), rooms: ["Lab2"]),
    Exam(subjectName: "Интернет програмирање", dateTime: DateTime(2025, 2, 5, 9, 0), rooms: ["Lab 12"]),
    Exam(subjectName: "Мобилни апликации", dateTime: DateTime(2026, 2, 7, 11, 30), rooms: ["Lab 13"]),
  ];

  @override
  Widget build(BuildContext context) {
    exams.sort((a, b) => a.dateTime.compareTo(b.dateTime));

    return Scaffold(
      appBar: AppBar(
        title: Text('Распоред за испити - $studentIndex'),
        backgroundColor: Colors.yellow.shade200,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: exams.length,
              itemBuilder: (context, index) {
                final exam = exams[index];
                return ExamCard(
                  exam: exam,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ExamDetailScreen(exam: exam),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Container(
            color: Colors.red.shade200,
            padding: const EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.book, color: Colors.black),
                const SizedBox(width: 8),
                Text(
                  "Вкупно испити: ${exams.length}",
                  style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
