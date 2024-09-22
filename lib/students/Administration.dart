import 'package:flutter/material.dart';

class AdministrationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Administration Grievances',
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
                grievanceType: 'Administration Delay',
                timeline: '2024-09-22',
                commentFrom: 'Admin Officer',
                comment: 'We are working on your request.',
                grievanceID: 'GRV-654321',
                status: 'In Progress',
              ),
              SizedBox(height: 10),
              GrievanceCard(
                grievanceType: 'Policy Inquiry',
                timeline: '2024-09-23',
                commentFrom: 'Head of Administration',
                comment: 'The policy has been clarified.',
                grievanceID: 'GRV-112233',
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
