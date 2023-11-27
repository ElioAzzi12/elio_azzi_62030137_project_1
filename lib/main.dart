import 'package:flutter/material.dart';
import 'student.dart';
import 'course.dart';

void main() {
  runApp(MaterialApp(
    home: UniversityID(),
  ));
}

class UniversityID extends StatefulWidget {
  const UniversityID({super.key});

  @override
  State<UniversityID> createState() => _UniversityIDState();
}

class _UniversityIDState extends State<UniversityID> {
  Student student = Student(
    name: 'Elio Azzi',
    email: '62030137@students.li.edu.lb',
    gpa: 3.5,
    currentSemester: 'Fall 2023',
    courses: [
      Course(name: 'Mathematics', creditHours: 3),
      Course(name: 'Physics', creditHours: 4),
      Course(name: 'Computer Science', creditHours: 3),
    ],
  );

  Course? selectedCourse;

  void _dropCourse(Course course) {
    setState(() {
      student.courses.remove(course);
      if (selectedCourse == course) {
        selectedCourse = null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[900],
      appBar: AppBar(
        title: Text('University ID Card'),
        centerTitle: true,
        backgroundColor: Colors.teal[400],
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(30, 40, 30, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/churro.png'),
                  radius: 40,
                ),
              ),
              Divider(
                height: 60,
                color: Colors.white,
              ),
              Text('NAME',
                style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 2,
                ),
              ),
              SizedBox(height: 10),
              Text(student.name,
                style: TextStyle(
                  color: Colors.blue,
                  letterSpacing: 2,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 30),
              Text('CURRENT GPA:',
                style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 2,
                ),
              ),
              SizedBox(height: 10),
              Text('${student.gpa.toStringAsFixed(2)}',
                style: TextStyle(
                  color: Colors.blue,
                  letterSpacing: 2,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 30),
              Row(
                children: [
                  Icon(
                    Icons.email,
                    color: Colors.grey[400],
                  ),
                  SizedBox(width: 10),
                  Text(
                    student.email,
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 18,
                      letterSpacing: 1,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Text('Current Semester: ${student.currentSemester}',
                style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 2,
                ),
              ),
              SizedBox(height: 20),
              Text('Select Course:',
                style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 2,
                ),
              ),
              DropdownButton<Course>(
                value: selectedCourse,
                hint: Text('Choose a course',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                items: student.courses.map<DropdownMenuItem<Course>>((Course course) {
                  return DropdownMenuItem<Course>(
                    value: course,
                    child: Text(course.name,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  );
                }).toList(),
                onChanged: (Course? newValue) {
                  setState(() {
                    selectedCourse = newValue;
                  });
                },
                dropdownColor: Colors.teal[700],
              ),
              selectedCourse != null
                  ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Selected Course: ${selectedCourse!.name}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  Text('Credits: ${selectedCourse!.creditHours}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  TextButton(
                    onPressed: () => _dropCourse(selectedCourse!),
                    child: Text('Drop Course'),
                    style: TextButton.styleFrom(foregroundColor: Colors.red),
                  ),
                ],
              )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
