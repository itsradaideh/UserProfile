import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class DetailPage extends StatefulWidget {
  const DetailPage(
      {Key? key,
      required this.images,
      required this.title,
      required this.price,
      required this.description})
      : super(key: key);
  final String images;
  final String title;
  final String price;
  final String description;

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
          Container(
            color: const Color.fromARGB(255, 245, 242, 242),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                  padding: EdgeInsets.only(
                    left: screenWidth / 20,
                    bottom: 20,
                    right: 20,
                  ),
                  child: ReadMoreText(
                    widget.description,
                    trimLines: 4,
                    trimMode: TrimMode.Line,
                    trimExpandedText: ' show less',
                    trimCollapsedText: ' show more',
                    moreStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                    lessStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Text(
                            'PRICE',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.green,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            widget.price,
                            style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Colors.green,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        height: 50,
                        width: 160,
                        child: TextButton(
                          onPressed: () {
                            // ****************************
                            print('Pay tapped');
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.blue,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text(
                            'PAY',
                            style: TextStyle(
                              fontFamily: 'NimbusSanL',
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
