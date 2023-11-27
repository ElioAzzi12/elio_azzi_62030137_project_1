// student.dart
import 'course.dart';

class Student {
  String name;
  String email;
  double gpa;
  String currentSemester;
  List<Course> courses;

  Student({
    required this.name,
    required this.email,
    required this.gpa,
    required this.currentSemester,
    required this.courses,
  });
}
