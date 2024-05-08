import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key, required this.images, required this.title, required this.price}) : super(key: key);
  final String images;
  final String title;
  final String price;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  double screenWidth = 0;
  double screenHeight = 0;

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Hero(
            tag: widget.title,
            child: ClipRRect(
              // borderRadius: const BorderRadius.only(
              //   bottomRight: Radius.circular(50),
              //   bottomLeft: Radius.circular(50),
              // ),
              child: SizedBox(
                height: screenHeight / 3.5,
                width: screenWidth,
                child: Image.network(
                  widget.images,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth / 20,
              vertical: 20,
            ),
            child: Text(
              widget.title,
              style: const TextStyle(
                fontWeight: FontWeight.w900,
                color: Colors.black87,
                fontSize: 30,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth / 20,
            ),
            child: Text(
              widget.price,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                color: Colors.black87,
                fontSize: 16,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth / 20,
              vertical: 20,
            ),
            child: const Text(
              "In-Stock",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.green,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}