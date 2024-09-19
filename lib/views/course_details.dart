import 'package:course_ui/views/models/course_scroll_model.dart';
import 'package:flutter/material.dart';

import 'models/course_models.dart';

class Details extends StatefulWidget {
  const Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  final courses = CourseModels.courseData;
  final avatars = CourseScrollModel.courseScrollModel[0].participants;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[100],
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Scaffold(
        // backgroundColor: Colors.lightGreenAccent,
        appBar: AppBar(
          leading: const Icon(Icons.arrow_back_ios),
          centerTitle: true,
          title: const Text(
            "Details",
            style: TextStyle(fontWeight: FontWeight.w900),
          ),
          actions: [
            IconButton.filledTonal(
                onPressed: () {},
                icon: const Icon(Icons.notifications_active_sharp))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Stack(
            children: [
              Column(
                children: [
                  //   course article
                  Container(
                    padding: const EdgeInsets.all(20),
                    alignment: Alignment.topLeft,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Our student",
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 17),
                        ),
                        Row(
                          children: [
                            for (String url in avatars)
                              CircleAvatar(
                                backgroundImage: AssetImage(url),
                                radius: 20,
                              )
                          ],
                        ),
                        const Text(
                          "Photoshop Editing Course",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 19),
                        ),
                        const Text(
                          "A representation that can convey the three-dimensional \naspect of a design through a two dimensional medium",
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 14),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.play_circle_outlined,
                                  color: Colors.black,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text("30 Lessons"),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.access_time_outlined,
                                  color: Colors.black,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text("13hr 30mins")
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  //   video list options
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Videos",
                        style: TextStyle(
                            fontSize: 19, fontWeight: FontWeight.w600),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text("View all"),
                      ),
                    ],
                  ),

                  //   video list items
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.all(5),
                      padding: const EdgeInsets.all(5),
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          final course = courses[index];
                          return Card(
                            margin: const EdgeInsets.all(6),
                            elevation: 3,
                            child: Container(
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(30),
                                ),
                                color: Colors.white,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: const Icon(Icons.lock),
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          course.topic,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 20),
                                        ),
                                        Text(course.duration)
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 7.0),
                                    child: Container(
                                      padding: const EdgeInsets.all(1),
                                      margin: const EdgeInsets.all(1),
                                      decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                          border: Border.symmetric(
                                            vertical: BorderSide(
                                              color: Colors.black,
                                              width: 2,
                                            ),
                                            horizontal: BorderSide(
                                              color: Colors.black,
                                              width: 2,
                                            ),
                                          )),
                                      child: TextButton(
                                          onPressed: () {},
                                          child: const Row(
                                            children: [
                                              Icon(Icons.access_time),
                                              SizedBox(
                                                width: 6,
                                              ),
                                              Text("Play video")
                                            ],
                                          )),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        itemCount: courses.length,
                      ),
                    ),
                  )
                ],
              ),
              //   enrolling button
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: const EdgeInsets.all(2.0),
                  margin: const EdgeInsets.all(1),
                  color: Colors.white70,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton.filledTonal(
                        onPressed: () {},
                        icon: const Icon(Icons.shopping_bag_rounded),
                      ),
                      // const SizedBox(width: 30,),
                      FilledButton(
                          onPressed: () {}, child: const Text("Enroll"))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
