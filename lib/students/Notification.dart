import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu, color: Colors.white),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        title: Text(
          'Notifications',
          style: TextStyle(color: Colors.white),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF082D74), Color(0xFFFC4F00)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF082D74),
              ),
              child: Text(
                'Menu',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context);
                // Add navigation functionality here
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                Navigator.pop(context);
                // Add navigation functionality here
              },
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              NotificationCard(
                type: 'Grievance Submitted',
                detail: 'Your grievance regarding academic issues has been submitted.',
                submittedOn: '2024-09-22',
                resolvedOn: '',
                status: 'Submitted',
                grievanceID: 'GRV-001122',
              ),
              SizedBox(height: 10),
              NotificationCard(
                type: 'Grievance In Progress',
                detail: 'Your grievance is now being processed by the Dean.',
                submittedOn: '2024-09-22',
                resolvedOn: '',
                status: 'In Progress',
                grievanceID: 'GRV-001122',
              ),
              SizedBox(height: 10),
              NotificationCard(
                type: 'Grievance Resolved',
                detail: 'Your grievance has been resolved by the lecturer.',
                submittedOn: '2024-09-22',
                resolvedOn: '2024-09-25',
                status: 'Resolved',
                grievanceID: 'GRV-001122',
              ),
              SizedBox(height: 10),
              // Example of a notification not following the format
              GenericNotificationCard(
                message: 'You have a new message from the administration.',
              ),
              SizedBox(height: 10),
              // Add more notifications as needed
            ],
          ),
        ),
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  final String type;
  final String detail;
  final String submittedOn;
  final String resolvedOn;
  final String status;
  final String grievanceID;

  const NotificationCard({
    required this.type,
    required this.detail,
    required this.submittedOn,
    required this.resolvedOn,
    required this.status,
    required this.grievanceID,
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
              'Type: $type',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Detail: $detail',
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(height: 8),
            Text(
              'Submitted On: $submittedOn',
              style: TextStyle(fontSize: 14),
            ),
            if (resolvedOn.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  'Resolved On: $resolvedOn',
                  style: TextStyle(fontSize: 14),
                ),
              ),
            SizedBox(height: 8),
            Text(
              'Status: $status',
              style: TextStyle(fontSize: 14, color: Colors.blue),
            ),
            SizedBox(height: 8),
            Text(
              'Grievance ID: $grievanceID',
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}

class GenericNotificationCard extends StatelessWidget {
  final String message;

  const GenericNotificationCard({required this.message});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          message,
          style: TextStyle(fontSize: 14),
        ),
      ),
    );
  }
}
