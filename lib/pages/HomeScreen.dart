import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:line_icons/line_icons.dart';
import '../json/favourite_json.dart';
import '../json/home_json.dart';
import '../theme/colors.dart';
import 'book_detail_page.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  List apiData = [
    {
      "name": "Muscle",
      "author": "Alan Trotter",
      "backgroundimg": Colors.orangeAccent.withOpacity(0.2),
      "image":
          "https://plus.unsplash.com/premium_photo-1669652639337-c513cc42ead6?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=387&q=80",
    },
    {
      "name": "The Cold",
      "author": "Jaas Walter",
      "backgroundimg": Colors.lightBlueAccent.withOpacity(0.2),
      "image":
          "https://images.unsplash.com/photo-1491841573634-28140fc7ced7?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjB8fGJvb2tzfGVufDB8fDB8fHww&auto=format&fit=crop&w=600&q=60",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Book Store App',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
            color: Colors.black,
          ),
          onPressed: () {},
          // color: Colors.black,
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 12),
            child: Icon(
              Icons.person_outline_outlined,
              color: Colors.black,
              // color: Colors.black,
            ),
          ),
        ],
      ),
      body: getBody(apiData: apiData),
    );
  }
}

class getBody extends StatelessWidget {
  const getBody({
    required this.apiData,
  });

  final List apiData;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            //search menu
            TextField(
              decoration: InputDecoration(
                hintText: "Search For Books...",
                filled: true,
                fillColor: Colors.grey.shade100,
                prefixIcon: const Icon(Icons.search_rounded,
                    color: Colors.black54, size: 30),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(
              height: 10,
            ),

            //Title Popular
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Popular Books',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 25),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('Show All',
                      style: TextStyle(color: primary, fontSize: 16)),
                ),
              ],
            ),

            const SizedBox(
              height: 10,
            ),

            //List Popular

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(specialForYouJson.length, (index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => BookDetailPage(
                                    img: specialForYouJson[index]['img'],
                                    title: specialForYouJson[index]['title'],
                                    subTitle: specialForYouJson[index]
                                        ['sub_title'],
                                    price: specialForYouJson[index]['price']
                                        .toString(),
                                    page: specialForYouJson[index]['page'],
                                    authorName: specialForYouJson[index]
                                        ['author_name'],
                                    rate: specialForYouJson[index]['rate']
                                        .toString(),
                                  )));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Container(
                                width: 120,
                                height: 160,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            specialForYouJson[index]['img']),
                                        fit: BoxFit.cover),
                                    borderRadius: BorderRadius.circular(12)),
                              ),
                              Container(
                                width: 120,
                                height: 160,
                                decoration: BoxDecoration(
                                    color: black.withOpacity(0.02),
                                    borderRadius: BorderRadius.circular(12)),
                              ),
                              Positioned(
                                right: 10,
                                top: 10,
                                child: Container(
                                  width: 30,
                                  height: 30,
                                  decoration: const BoxDecoration(
                                      color: white, shape: BoxShape.circle),
                                  child: Icon(
                                    specialForYouJson[index]['favourite']
                                        ? LineIcons.heartAlt
                                        : LineIcons.heart,
                                    size: 20,
                                    color: danger,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 100,
                                child: Container(
                                  height: 25,
                                  width: 65,
                                  decoration: const BoxDecoration(
                                      color: primary,
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(12),
                                          bottomRight: Radius.circular(12))),
                                  child: Center(
                                    child: Text(
                                      "\$ " + specialForYouJson[index]['price'],
                                      style: const TextStyle(
                                          fontSize: 14,
                                          color: white,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            width: 120,
                            child: Text(
                              specialForYouJson[index]['title'],
                              maxLines: 1,
                              style: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w600),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          SizedBox(
                            width: 120,
                            child: Text(
                              specialForYouJson[index]['sub_title'],
                              maxLines: 1,
                              style: TextStyle(
                                  fontSize: 13, color: black.withOpacity(0.4)),
                            ),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          SizedBox(
                            width: 120,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                RatingBar.builder(
                                  ignoreGestures: true,
                                  initialRating: specialForYouJson[index]
                                      ['rate'],
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  itemSize: 14,
                                  itemPadding: const EdgeInsets.only(right: 2),
                                  itemBuilder: (context, _) => const Icon(
                                    Icons.star,
                                    color: danger,
                                  ),
                                  onRatingUpdate: (rating) {},
                                ),
                                Text(
                                  "(${specialForYouJson[index]['rate']})",
                                  style: const TextStyle(
                                      color: danger,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),

            // Container(
            //   width: MediaQuery.of(context).size.width,
            //   height: 250,
            //   child: ListView.builder(
            //       itemCount: recommendationsList.length,
            //       scrollDirection: Axis.horizontal,
            //       shrinkWrap: true,
            //       physics: BouncingScrollPhysics(),
            //       itemBuilder: (BuildContext context, int index) {
            //         return Container(
            //           child: Column(
            //             children: [
            //               //Book Image
            //               Container(
            //                 width: 200,
            //                 height: 190,
            //                 margin: const EdgeInsets.only(right: 10),
            //                 decoration: BoxDecoration(
            //                   // color: greyLight,
            //                   borderRadius: BorderRadius.circular(20),
            //                   border: Border.all(color: Colors.black.withOpacity(0.1))
            //                 ),
            //                 child: Padding(
            //                   padding: const EdgeInsets.all(15.0),
            //                   child:
            //                       Image.network("${recommendationsList[index]['img']}", fit: BoxFit.fill,),
            //                 ),
            //               ),

            //               //Title and Author
            //               Container(
            //                 margin: EdgeInsets.only(right: 19),
            //                 // color: Colors.blue,
            //                 width: 180,
            //                 child: Row(children: [
            //                   Column(
            //                     crossAxisAlignment: CrossAxisAlignment.start,
            //                     children: [
            //                       Text(
            //                         "${recommendationsList[index]['title']}",
            //                         style: const TextStyle(
            //                             fontWeight: FontWeight.w600),
            //                       ),
            //                       Text(
            //                         "By ${recommendationsList[index]['author_name']}",
            //                         style: TextStyle(
            //                             color: Colors.green.shade300),
            //                       ),
            //                     ],
            //                   ),
            //                   IconButton(
            //                       onPressed: () {},
            //                       icon: const Icon(Icons.bookmark_border)),
            //                 ]),
            //               ),
            //             ],
            //           ),
            //         );
            //       }),
            // ),

            //Title Trending
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Trending Now',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 25),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('Show All',
                      style: TextStyle(color: primary, fontSize: 16)),
                ),
              ],
            ),

            const SizedBox(
              height: 10,
            ),

            Row(
              children: List.generate(tags.length, (index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Container(
                    decoration: BoxDecoration(
                        color: tags[index]['color'],
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 6, horizontal: 10),
                        child: Text(
                          tags[index]['label'],
                          style: const TextStyle(fontSize: 12, color: white),
                        )),
                  ),
                );
              }),
            ),

            const SizedBox(
              height: 15,
            ),

            //Title & Author
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 300,
              child: ListView.builder(
                  itemCount: favouriteBooksJson.length,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border:
                              Border.all(color: Colors.black.withOpacity(0.3))),
                      child: IntrinsicHeight(
                        child: Row(
                          children: [
                            Container(
                              width: 130,
                              height: 210,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                // border: Border.all(color: Colors.black),
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: Image.network(
                                      "${favouriteBooksJson[index]['img']}",
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                      "💲${favouriteBooksJson[index]['price']}"),
                                ],
                              ),
                            ),
                            VerticalDivider(
                              color: Colors.black.withOpacity(0.3),
                              thickness: 1,
                              width: 10,
                            ),
                            SizedBox(
                              // color: Colors.blue,
                              width: 240,
                              height: 180,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${favouriteBooksJson[index]['title']}",
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w600),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "By ${favouriteBooksJson[index]['author_name']}",
                                        style: TextStyle(
                                            color: Colors.grey.shade400),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.star_rounded,
                                            color: Colors.yellow,
                                          ),
                                          Text(favouriteBooksJson[index]
                                              ['rate']),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                        ],
                                      ),
                                      Text(
                                          "Page - ${favouriteBooksJson[index]['page']}"),
                                    ],
                                  ),
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.bookmark_border)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
