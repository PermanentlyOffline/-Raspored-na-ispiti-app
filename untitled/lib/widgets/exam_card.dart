import 'package:flutter/material.dart';
import '../models/exam.dart';
import 'package:intl/intl.dart';

class ExamCard extends StatelessWidget {
  final Exam exam;
  final VoidCallback onTap;

  const ExamCard({required this.exam, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    final isPast = exam.dateTime.isBefore(DateTime.now());
    final dateFormatted = DateFormat('dd.MM.yyyy').format(exam.dateTime);
    final timeFormatted = DateFormat('HH:mm').format(exam.dateTime);

    return Card(
      color: isPast ? Colors.grey.shade100 : Colors.green.shade100,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      child: ListTile(
        onTap: onTap,
        leading: Icon(
          Icons.edit,
          size: 30,
          color: isPast ? Colors.grey : Colors.indigo,
        ),
        title: Text(
          exam.subjectName,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: isPast ? Colors.grey.shade600 : Colors.black,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.calendar_today, size: 16, color: Colors.green),
                const SizedBox(width: 4),
                Text("$dateFormatted - $timeFormatted"),
              ],
            ),
            Row(
              children: [
                const Icon(Icons.location_on, size: 16, color: Colors.red),
                const SizedBox(width: 4),
                Text(exam.rooms.join(", ")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
