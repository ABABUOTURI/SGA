import 'package:flutter/material.dart';
import 'dart:math'; // For generating tracking ID
import 'package:file_picker/file_picker.dart'; // For file picking

class SubmitGrievancePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Submit Grievance',
          style: TextStyle(color: Colors.white),
        ),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.white,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer(); // Open the drawer
              },
            );
          },
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GrievanceFormBody(),
      ),
      drawer: Drawer(
        child: Container(
          width: 200, // Set your desired width
          height: 400, // Set your desired height (or adjust based on content)
          child: Column(
            children: [
              DrawerHeader(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                decoration: BoxDecoration(
                  color: Color(0xFF082D74),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Center(
                        child: Text(
                          'Menu',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.close, color: Colors.white),
                      onPressed: () {
                        Navigator.of(context).pop(); // Close the drawer
                      },
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    ListTile(
                      leading: Icon(Icons.dashboard, color: Colors.blue),
                      title: Text('Dashboard'),
                      onTap: () {
                        Navigator.pushNamed(context, '/dashboard');
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.add, color: Colors.blue),
                      title: Text('Submit Grievance'),
                      onTap: () {
                        Navigator.pushNamed(context, '/submit_grievance');
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.receipt, color: Colors.blue),
                      title: Text('Receipts'),
                      onTap: () {
                        Navigator.pushNamed(context, '/page2');
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.notifications, color: Colors.blue),
                      title: Text('Notifications'),
                      onTap: () {
                        Navigator.pushNamed(context, '/notifications');
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GrievanceFormBody extends StatefulWidget {
  @override
  _GrievanceFormBodyState createState() => _GrievanceFormBodyState();
}

class _GrievanceFormBodyState extends State<GrievanceFormBody> {
  String grievanceType = 'Academic';
  final _descriptionController = TextEditingController();
  final _grievanceDetailsController = TextEditingController();
  String? _selectedDocument; // Path for the selected document
  String? _selectedImage; // Path for the selected image

  // Function to generate a unique tracking ID
  String _generateTrackingID() {
    var rng = Random();
    return 'GRV-${rng.nextInt(900000) + 100000}'; // Example format: GRV-123456
  }

  // Function to submit the form
  void _submitForm() {
    // Submit logic, generate tracking ID, auto-assign department
    String trackingID = _generateTrackingID();
    String department = _autoAssignDepartment(grievanceType);

    // Logic to send email notification with tracking ID
    _sendEmailNotification(trackingID);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Grievance Submitted: $trackingID')),
    );

    // Navigate to grievance review page after showing success message
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushNamed(context, '/grievanceReview');
    });
  }

  // Function to auto-assign department based on grievance type
  String _autoAssignDepartment(String grievanceType) {
    switch (grievanceType) {
      case 'Academic':
        return 'Academic Department';
      case 'Administrative':
        return 'Administration';
      case 'Harassment':
        return 'Disciplinary Department';
      case 'Other':
        return 'General Complaints';
      default:
        return 'General Department';
    }
  }

  // Mock function to send email notification
  void _sendEmailNotification(String trackingID) {
    // Mock logic for sending an email with tracking ID
    print('Email sent with Tracking ID: $trackingID');
  }

  // Function to show terms and conditions alert
  void _showTermsAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Terms and Conditions'),
          content: Text('By clicking Accept, you agree to submit the grievance.'),
          actions: [
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Color(0xFFFFC107), backgroundColor: Color(0xFF082D74), // Text color
              ),
              child: Text('Accept'),
              onPressed: () {
                Navigator.pop(context);
                _submitForm(); // Proceed to submit after accepting
              },
            ),
          ],
        );
      },
    );
  }

  // Function to pick a document
  Future<void> _pickDocument() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.any);
    if (result != null) {
      setState(() {
        _selectedDocument = result.files.single.path;
      });
    }
  }

  // Function to pick an image
  Future<void> _pickImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.image);
    if (result != null) {
      setState(() {
        _selectedImage = result.files.single.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Grievance Type Card
          Card(
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: DropdownButtonFormField<String>(
                value: grievanceType,
                decoration: InputDecoration(
                  labelText: 'Type of Grievance',
                ),
                items: [
                  DropdownMenuItem(child: Text('Academic'), value: 'Academic'),
                  DropdownMenuItem(child: Text('Administrative'), value: 'Administrative'),
                  DropdownMenuItem(child: Text('Harassment'), value: 'Harassment'),
                  DropdownMenuItem(child: Text('Other'), value: 'Other'),
                ],
                onChanged: (value) {
                  setState(() {
                    grievanceType = value!;
                  });
                },
              ),
            ),
          ),
          if (grievanceType == 'Other')
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: _grievanceDetailsController,
                  decoration: InputDecoration(labelText: 'Specify Grievance'),
                ),
              ),
            ),

          // Description Card
          Card(
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _descriptionController,
                maxLines: 5,
                decoration: InputDecoration(
                  labelText: 'Description',
                ),
              ),
            ),
          ),

          // Upload Document Input (Optional)
          Card(
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListTile(
                title: Text('Upload Document (Optional)'),
                subtitle: Text(_selectedDocument ?? 'No document selected'),
                trailing: IconButton(
                  icon: Icon(Icons.attach_file),
                  onPressed: _pickDocument,
                ),
              ),
            ),
          ),

          // Upload Image Input (Optional)
          Card(
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListTile(
                title: Text('Upload Image (Optional)'),
                subtitle: Text(_selectedImage ?? 'No image selected'),
                trailing: IconButton(
                  icon: Icon(Icons.photo),
                  onPressed: _pickImage,
                ),
              ),
            ),
          ),
          SizedBox(height: 10.0),
          // Submit Button
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Color(0xFFFFC107), 
                backgroundColor: Color(0xFF082D74), // Button background color
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              ),
              child: Text('Submit Grievance'),
              onPressed: () => _showTermsAlert(context), // Show terms alert
            ),
          ),
        ],
      ),
    );
  }
}
