import 'package:flutter/material.dart';

class AcademicPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Academic Grievances',
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
              // Example grievance card - You can add multiple such cards based on data
              GrievanceCard(
                grievanceType: 'Academic',
                timeline: '2024-09-20',
                commentFrom: 'Dean of Faculty',
                comment: 'We are looking into your concern.',
                grievanceID: 'GRV-123456',
                status: 'In Progress',
              ),
              SizedBox(height: 10),
              GrievanceCard(
                grievanceType: 'Course Material Issue',
                timeline: '2024-09-21',
                commentFrom: 'Lecturer',
                comment: 'Materials have been updated.',
                grievanceID: 'GRV-789101',
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

class GrievanceCard extends StatelessWidget {
  final String grievanceType;
  final String timeline;
  final String commentFrom;
  final String comment;
  final String grievanceID;
  final String status;

  const GrievanceCard({
    required this.grievanceType,
    required this.timeline,
    required this.commentFrom,
    required this.comment,
    required this.grievanceID,
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
              'Grievance Type: $grievanceType',
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
              'Grievance ID: $grievanceID',
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
