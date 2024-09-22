import 'package:flutter/material.dart';

class GrievanceReviewStudentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFFFC107), Color(0xFF082D74)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        title: Row(
          children: [
            Builder(
              builder: (context) => IconButton(
                icon: Icon(Icons.menu, color: Colors.white),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              ),
            ),
            Expanded(
              child: Text(
                'Grievance Review',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
            ),
            Container(
              width: 150,
              height: 40,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: TextStyle(color: Colors.white),
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.3),
                  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none,
                  ),
                ),
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(width: 5),
            CircleAvatar(
              backgroundImage: AssetImage('assets/profile_photo.jpg'),
            ),
          ],
        ),
      ),
      drawer: Container(
        child: Drawer(
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
                        Navigator.pushNamed(context, '/notificatins');
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Grievance Progress',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 12),
              Card(
                elevation: 2,
                margin: EdgeInsets.all(8),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    childAspectRatio: 3.0,
                    children: [
                      _buildProgressBar('Academic Progress', 0.65),
                      _buildProgressBar('Administration Progress', 0.80),
                      _buildProgressBar('Disciplinary Progress', 0.45),
                      _buildProgressBar('Harassment Progress', 0.30),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                height: 500,
                child: Card(
                  elevation: 2,
                  margin: EdgeInsets.all(8),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: GridView.count(
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.all(8.0),
                      children: [
                        _buildGrievanceCard(context, 'Academic'),
                        _buildGrievanceCard(context, 'Administration'),
                        _buildGrievanceCard(context, 'Disciplinary'),
                        _buildGrievanceCard(context, 'Harassment'),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/s_grievance');
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Color(0xFFFFC107),
                      backgroundColor: Color(0xFF082D74),
                      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    ),
                    child: Text('Submit New Grievance'),
                  ),
                  SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/student_grievance');
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Color(0xFFFFC107),
                      backgroundColor: Color(0xFF082D74),
                      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    ),
                    child: Text('Comment'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProgressBar(String title, double progressValue) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Stack(
            children: [
              Container(
                height: 20,
                decoration: BoxDecoration(
                  color: Color(0xFFFFC107),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Container(
                height: 20,
                width: progressValue * 150,
                decoration: BoxDecoration(
                  color: Color(0xFF082D74),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Positioned.fill(
                child: Center(
                  child: Text(
                    '${(progressValue * 100).toStringAsFixed(0)}%',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildGrievanceCard(BuildContext context, String title) {
    return GestureDetector(
      onTap: () {
        switch (title) {
          case 'Academic':
            Navigator.pushNamed(context, '/academic');
            break;
          case 'Administration':
            Navigator.pushNamed(context, '/administration');
            break;
          case 'Disciplinary':
            Navigator.pushNamed(context, '/disciplinary');
            break;
          case 'Harassment':
            Navigator.pushNamed(context, '/harassment');
            break;
        }
      },
      child: Card(
        elevation: 2,
        margin: EdgeInsets.all(8),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Icon(
                Icons.report_problem,
                size: 40,
                color: Colors.blue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
