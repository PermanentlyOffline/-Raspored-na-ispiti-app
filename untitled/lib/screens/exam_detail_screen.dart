import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/exam.dart';

class ExamDetailScreen extends StatelessWidget {
  final Exam exam;

  const ExamDetailScreen({required this.exam});

  String _timeUntilExam() {
    final now = DateTime.now();
    if (exam.dateTime.isBefore(now)) return "Испитот е завршен.";

    final diff = exam.dateTime.difference(now);
    final days = diff.inDays;
    final hours = diff.inHours % 24;

    return "$days дена, $hours часа \n""преостануваат до испитот";
  }

  @override
  Widget build(BuildContext context) {
    final dateFormatted = DateFormat('dd.MM.yyyy HH:mm').format(exam.dateTime);

    return Scaffold(
      appBar: AppBar(
        title: Text(exam.subjectName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Card(
          elevation: 3,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  exam.subjectName,
                  style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 11),
                Row(
                  children: [
                    const Icon(Icons.calendar_month, color: Colors.green),
                    const SizedBox(width: 8),
                    Text("Датум и време: $dateFormatted"),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.location_on, color: Colors.red),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text("Простории: ${exam.rooms.join(", ")}"),
                    ),
                  ],
                ),
                const Divider(height: 30),
                Row(
                  children: [
                    const Icon(Icons.timer, color: Colors.brown),
                    const SizedBox(width: 8),
                    Text(
                      _timeUntilExam(),
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
