import 'package:course_ui/views/course_payment.dart';
import 'package:course_ui/views/models/course_scroll_model.dart';
import 'package:flutter/material.dart';

import 'course_details.dart';

class CourseHomepage extends StatefulWidget {
  const CourseHomepage({super.key});

  @override
  State<CourseHomepage> createState() => _CourseHomepageState();
}

class _CourseHomepageState extends State<CourseHomepage> {
  final courseScroll = CourseScrollModel.courseScrollModel;
  Widget view = HomeMain();
  int selectedIndex = 0;
  final views = [
    HomeMain(),
    const Details(),
    const CoursePayment(),
    const CoursePayment()
  ];

  final menus = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.home_outlined),
      activeIcon: Icon(Icons.home),
      label: "Home",
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.heart_broken_outlined),
      activeIcon: Icon(Icons.heart_broken),
      label: "Favourite",
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.notifications_outlined),
      activeIcon: Icon(Icons.notifications),
      label: "Notice",
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.person_outline),
      activeIcon: Icon(Icons.person),
      label: "Personalization",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        leading: Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(99),
              color: const Color.fromARGB(255, 205, 162, 146)),
          child: Image.asset(
            "assets/woman_simple.png",
            width: 30,
          ),
        ),
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Christiana Amandla",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              "Let's learning to smart",
              style: TextStyle(fontSize: 13, color: Colors.blueGrey),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
              style: IconButton.styleFrom(backgroundColor: Colors.white),
            ),
          )
        ],
      ),
      body: view,
      bottomNavigationBar: BottomNavigationBar(
        items: menus,
        currentIndex: selectedIndex,
        selectedItemColor: const Color.fromARGB(255, 120, 247, 2),
        unselectedItemColor: const Color.fromARGB(255, 98, 107, 112),
        onTap: (value) {
          setState(() {
            selectedIndex = value;
            view = views[value];
          });
        },
      ),
    );
  }
}

class HomeMain extends StatelessWidget {
  HomeMain({
    super.key,
  });

  final courseScroll = CourseScrollModel.courseScrollModel;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          // course description
          const CourseDescription(),

          // popular course scroller
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10.0,
              vertical: 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Popular Course",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(onPressed: () {}, child: const Text("View All"))
              ],
            ),
          ),

          SizedBox(
            width: double.infinity,
            height: 250,
            child: ListView.builder(
              itemBuilder: (context, index) {
                final scrollCourse = courseScroll[index];
                return Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 252, 255, 255),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 200,
                          alignment: Alignment.topCenter,
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                            // color: Colors.red,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Container(
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10)),
                            child: Image.asset(
                              scrollCourse.url,
                              width: 80,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "${scrollCourse.name} Editing\nCourse",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(
                          width: 200,
                          child: Stack(
                            children: [
                              Positioned(
                                child: Container(
                                  clipBehavior: Clip.hardEdge,
                                  decoration: BoxDecoration(
                                    color:
                                        const Color.fromARGB(255, 76, 168, 175),
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  child: Image.asset(
                                    scrollCourse.participants[0],
                                    width: 30,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 20,
                                child: Container(
                                  clipBehavior: Clip.hardEdge,
                                  decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        255, 213, 219, 156),
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  child: Image.asset(
                                    scrollCourse.participants[1],
                                    width: 30,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 40,
                                child: Container(
                                  clipBehavior: Clip.hardEdge,
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  child: Image.asset(
                                    scrollCourse.participants[2],
                                    width: 30,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 70,
                                child: Container(
                                  padding: const EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(999),
                                  ),
                                  child: const Text(
                                    "+30 ",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                              const Positioned(
                                right: 10,
                                top: 4,
                                child: Text(
                                  "Participant",
                                  style: TextStyle(color: Colors.black),
                                ),
                              )
                            ],
                          ),
                        ),

                        // a divider
                        Container(
                          margin: const EdgeInsets.symmetric(
                            vertical: 10,
                          ),
                          width: 200,
                          height: 1,
                          color: const Color.fromARGB(255, 231, 226, 226),
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CoursePopularity(
                              data: "4.8 (230)",
                              iconData: Icons.star,
                              colors: Colors.yellow,
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            CoursePopularity(
                              data: "30 Lessons",
                              iconData: Icons.play_circle_outline_rounded,
                              colors: Colors.black,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
              itemCount: courseScroll.length,
              scrollDirection: Axis.horizontal,
              physics: const AlwaysScrollableScrollPhysics(),
            ),
          ),

          // Popular course list
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10.0,
              vertical: 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Popular Course",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(onPressed: () {}, child: const Text("View All"))
              ],
            ),
          ),

          // course items

          SizedBox(
            height: 200,
            child: ListView.builder(
              itemBuilder: (context, index) {
                final course = courseScroll[index];
                return Card(
                  shadowColor: Colors.white70,
                  elevation: 4,
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    margin: const EdgeInsets.all(4.0),
                    child: Row(
                      children: [
                        Image.asset(
                          course.url,
                          width: 50,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${course.name} Editing Course",
                                style: const TextStyle(
                                    fontWeight: FontWeight.w700),
                              ),
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CoursePopularity(
                                    data: "4.8 (230)",
                                    iconData: Icons.star,
                                    colors: Colors.yellow,
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  CoursePopularity(
                                    data: "30 Lessons",
                                    iconData: Icons.play_circle_outline_rounded,
                                    colors: Colors.black,
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
              itemCount: courseScroll.length,
            ),
          )
        ],
      ),
    );
  }
}

class CoursePopularity extends StatelessWidget {
  const CoursePopularity(
      {super.key,
      required this.data,
      required this.iconData,
      required this.colors});
  final IconData iconData;
  final String data;
  final Color colors;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          iconData,
          color: colors,
        ),
        Text(data),
      ],
    );
  }
}

class CourseDescription extends StatelessWidget {
  const CourseDescription({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color.fromARGB(255, 96, 225, 101)),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white70,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Mathematical Course",
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(195, 160, 253, 0),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.calendar_today),
                      SizedBox(
                        width: 10,
                      ),
                      Text("23 Nov 2023"),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const DescriptionTriplet(
                iconData: Icons.access_time,
                header: "Completed",
                subheader: "20",
              ),
              Container(
                color: Colors.white,
                width: 1,
                height: 50,
              ),
              const DescriptionTriplet(
                iconData: Icons.access_time,
                header: "Completed",
                subheader: "20",
              )
            ],
          )
        ],
      ),
    );
  }
}

class DescriptionTriplet extends StatelessWidget {
  const DescriptionTriplet({
    super.key,
    required this.iconData,
    required this.header,
    required this.subheader,
  });

  final IconData iconData;
  final String header;
  final String subheader;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(iconData),
        const SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(header),
            Text(subheader),
          ],
        )
      ],
    );
  }
}
