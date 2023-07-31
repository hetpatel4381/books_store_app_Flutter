import 'package:books_store_app/theme/colors.dart';
import 'package:flutter/material.dart';

class PlayingNowPage extends StatefulWidget {
  final String img;
  final String title;
  final String subTitle;
  final BuildContext context; // Add this line to store the context

  const PlayingNowPage({
    Key? key, // Add Key as nullable
    required this.context, // Add this line to store the context
    required this.img,
    required this.title,
    required this.subTitle,
  }) : super(key: key);

  @override
  State<PlayingNowPage> createState() => _PlayingNowPageState();
}

class _PlayingNowPageState extends State<PlayingNowPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: PreferredSize(
        child: getAppBar(),
        preferredSize: const Size.fromHeight(60),
      ),
      body: getBody(),
    );
  }

  Widget getAppBar() {
    return AppBar(
      backgroundColor: white,
      elevation: 0,
      automaticallyImplyLeading: false,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(widget.context);
        },
        icon: const Icon(
          Icons.arrow_back_ios,
          size: 22,
          color: black,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.more_horiz,
            color: black,
            size: 30,
          ),
        ),
      ],
      title: const Text(
        "Playing Now",
        style: TextStyle(
          fontSize: 18,
          color: black,
        ),
      ),
      centerTitle: true,
    );
  }

  Widget getBody() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 500,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              boxShadow: [BoxShadow(
                blurRadius: 15,
                spreadRadius: 5,
                color: black.withOpacity(0.05),
                offset: Offset(0,10),
              )],
              image: DecorationImage(image: NetworkImage(widget.img), fit: BoxFit.cover)
            ),
          ),
          const SizedBox(height: 30,),
          Text(widget.title, style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          )),
          const SizedBox(height: 8,),
          Text(widget.subTitle, style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: black.withOpacity(0.6),
          )),
          const SizedBox(height: 30,),
          Stack(
            children: [
              Container(
                height: 4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: black.withOpacity(0.1),
                ),
              ),
              Container(
                height: 4,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: primary1,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("0:34:15", style: TextStyle(
                fontSize: 13,
                color: black.withOpacity(0.5)
              ),),
              Text("5:34:15", style: TextStyle(
                fontSize: 13,
                color: black.withOpacity(0.5)
              ),),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: (){}, 
                icon: const Icon(Icons.skip_previous_outlined, color: primary1, size: 25,),),
                const SizedBox(width: 25,),
                IconButton(
                  iconSize: 50,
                  onPressed: null,
                  icon: Container(
                    decoration: const BoxDecoration(
                      color: primary1,
                      shape: BoxShape.circle,
                    ),
                    child: const Center(
                      child: Icon(Icons.play_arrow, size: 30, color: white,),
                    ),
                  )),
                const SizedBox(width: 25,),
              IconButton(
                onPressed: (){}, 
                icon: const Icon(Icons.skip_next_outlined, color: primary1, size: 25,),),
            ],
          )
        ],
      ),
    );
  }
}
