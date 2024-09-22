import 'package:flutter/material.dart';

class DisciplinaryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Disciplinary Cases',
          style: TextStyle(color: Colors.white),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF082D74), Color(0xFFFFC107)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Example disciplinary card - You can add multiple such cards based on data
              DisciplinaryCard(
                caseType: 'Misconduct',
                timeline: '2024-09-22',
                commentFrom: 'Disciplinary Committee',
                comment: 'The case is under investigation.',
                caseID: 'DSC-987654',
                status: 'In Progress',
              ),
              SizedBox(height: 10),
              DisciplinaryCard(
                caseType: 'Violation of Rules',
                timeline: '2024-09-23',
                commentFrom: 'Head of Discipline',
                comment: 'The student has received a warning.',
                caseID: 'DSC-445566',
                status: 'Resolved',
              ),
              // Add more cards as needed
            ],
          ),
        ),
      ),
    );
  }
}

class DisciplinaryCard extends StatelessWidget {
  final String caseType;
  final String timeline;
  final String commentFrom;
  final String comment;
  final String caseID;
  final String status;

  const DisciplinaryCard({
    required this.caseType,
    required this.timeline,
    required this.commentFrom,
    required this.comment,
    required this.caseID,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Case Type: $caseType',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Timeline: $timeline',
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(height: 8),
            Text(
              'Comment From: $commentFrom',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Comment: $comment',
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(height: 8),
            Text(
              'Case ID: $caseID',
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(height: 8),
            Text(
              'Status: $status',
              style: TextStyle(fontSize: 14, color: Colors.blue),
            ),
          ],
        ),
      ),
    );
  }
}
