import 'package:flutter/material.dart';

class HarassmentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Harassment Cases',
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
              // Example harassment case card - You can add multiple such cards based on data
              HarassmentCard(
                caseType: 'Verbal Harassment',
                timeline: '2024-09-22',
                commentFrom: 'HR Department',
                comment: 'The case is currently being investigated.',
                caseID: 'HRS-112233',
                status: 'In Progress',
              ),
              SizedBox(height: 10),
              HarassmentCard(
                caseType: 'Physical Harassment',
                timeline: '2024-09-23',
                commentFrom: 'Security Officer',
                comment: 'Appropriate action has been taken.',
                caseID: 'HRS-445566',
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

class HarassmentCard extends StatelessWidget {
  final String caseType;
  final String timeline;
  final String commentFrom;
  final String comment;
  final String caseID;
  final String status;

  const HarassmentCard({
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
