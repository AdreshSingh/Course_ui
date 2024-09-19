class CourseModels{
  final int id;
  final String topic;
  final String duration;
  final bool status;
  CourseModels({
    required this.id,
    required this.topic,
    required this.duration,
    this.status = false
  });
  
  static final courseData = [
    CourseModels(id: 1, topic: "Introduction", duration: "3h 30min"),
    CourseModels(id: 2, topic: "Install Software", duration: "1h 30min"),
    CourseModels(id: 3, topic: "Learn Tools", duration: "2h 30min"),
    CourseModels(id: 4, topic: "Learn Activity", duration: "1h 30min"),
    CourseModels(id: 5, topic: "Self Activity", duration: "1h 30min"),
  ];

  List<CourseModels> getCourse() => courseData;
}