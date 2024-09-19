class CourseScrollModel {
  final int id;
  final String name;
  final String url;
  final List<String> participants = [
    "assets/woman_simple_puff.png",
    "assets/woman_simple.png",
    "assets/man_simple_2.jfif",
  ];
  final int lessonNumbers;
  final double rating;

  CourseScrollModel(
      {required this.id,
      required this.name,
      required this.url,
      this.lessonNumbers = 30,
      this.rating = 4.1});

  static final List<CourseScrollModel> courseScrollModel = [
    CourseScrollModel(
      id: 1,
      name: "Photoshop",
      url: "assets/adobe_xd.png",
    ),
    CourseScrollModel(
      id: 2,
      name: "Adobe Illustrator",
      url: "assets/ai.png",
    ),
    CourseScrollModel(
      id: 3,
      name: "Photoshop",
      url: "assets/adobe_xd.png",
    ),
    CourseScrollModel(
      id: 4,
      name: "Adobe Illustrator",
      url: "assets/ai.png",
    ),
  ];
}
