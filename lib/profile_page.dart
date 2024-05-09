import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:user_profile/custom_like_button.dart';
import 'package:user_profile/detail_page.dart';
import 'package:user_profile/product_reviews_screen.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  ProfilePageState createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  bool _isOpen = false;
  final PanelController _panelController = PanelController();
  final List<Map<String, dynamic>> gridMap = [
    {
      "description":
          "Creating meaningful user experiences is about more than just aesthetics—it's about connecting with people on a deeper level. As designers, we must embrace empathy, collaboration, and innovation to craft UI/UX designs that truly resonate. From striking a balance between creativity and functionality to fostering a culture of feedback and inclusivity, the key to success lies in focusing on the human element. In a rapidly evolving field, let's stay current with technology and always design with heart.",
      "title": "Better Experience Design",
      "price": "\$355",
      "images":
          "https://www.yellowslice.in/bed/wp-content/uploads/2022/08/fintech-ui-ux-design.png",
    },
    {
      "description":
          "Creating meaningful user experiences is about more than just aesthetics—it's about connecting with people on a deeper level. As designers, we must embrace empathy, collaboration, and innovation to craft UI/UX designs that truly resonate. From striking a balance between creativity and functionality to fostering a culture of feedback and inclusivity, the key to success lies in focusing on the human element. In a rapidly evolving field, let's stay current with technology and always design with heart.",
      "title": "You will get wondrous UX UI design",
      "price": "\$345",
      "images":
          "https://img.freepik.com/free-vector/gradient-ui-ux-background_23-2149051557.jpg",
    },
    {
      "description":
          "Creating meaningful user experiences is about more than just aesthetics—it's about connecting with people on a deeper level. As designers, we must embrace empathy, collaboration, and innovation to craft UI/UX designs that truly resonate. From striking a balance between creativity and functionality to fostering a culture of feedback and inclusivity, the key to success lies in focusing on the human element. In a rapidly evolving field, let's stay current with technology and always design with heart.",
      "title": "You will get wondrous UX UI design",
      "price": "\$475",
      "images":
          "https://res.cloudinary.com/upwork-cloud/image/upload/c_scale,w_1000/v1689702912/catalog/1613054000936062976/rpno0cbnvt06iz0kne5c.jpg",
    },
    {
      "description":
          "Creating meaningful user experiences is about more than just aesthetics—it's about connecting with people on a deeper level. As designers, we must embrace empathy, collaboration, and innovation to craft UI/UX designs that truly resonate. From striking a balance between creativity and functionality to fostering a culture of feedback and inclusivity, the key to success lies in focusing on the human element. In a rapidly evolving field, let's stay current with technology and always design with heart.",
      "title": "Better Experience Design",
      "price": "\$575",
      "images":
          "https://fiverr-res.cloudinary.com/images/q_auto,f_auto/gigs/335517501/original/de770a36061cbeb93474f1ecb7f4a7aa349ed150/do-ui-ux-design-using-figma-sass-website-figma-design-for-mobile-and-desktop.png",
    },
    {
      "description":
          "Creating meaningful user experiences is about more than just aesthetics—it's about connecting with people on a deeper level. As designers, we must embrace empathy, collaboration, and innovation to craft UI/UX designs that truly resonate. From striking a balance between creativity and functionality to fostering a culture of feedback and inclusivity, the key to success lies in focusing on the human element. In a rapidly evolving field, let's stay current with technology and always design with heart.",
      "title": "Better Experience Design",
      "price": "\$225",
      "images":
          "https://miro.medium.com/v2/resize:fit:682/1*j7TiBo6BraFMeXme9BHCcw.jpeg",
    },
    {
      "description":
          "Creating meaningful user experiences is about more than just aesthetics—it's about connecting with people on a deeper level. As designers, we must embrace empathy, collaboration, and innovation to craft UI/UX designs that truly resonate. From striking a balance between creativity and functionality to fostering a culture of feedback and inclusivity, the key to success lies in focusing on the human element. In a rapidly evolving field, let's stay current with technology and always design with heart.",
      "title": "You will get wondrous UX UI design",
      "price": "\$327",
      "images":
          "https://fiverr-res.cloudinary.com/images/t_main1,q_auto,f_auto,q_auto,f_auto/gigs/361401711/original/9f6a895b3e7fe61e2912137fb170fc894b3f1aeb/do-ui-ux-design-website-ui-ux-design-or-app-ux-ui-design.png",
    },
    {
      "description":
          "Creating meaningful user experiences is about more than just aesthetics—it's about connecting with people on a deeper level. As designers, we must embrace empathy, collaboration, and innovation to craft UI/UX designs that truly resonate. From striking a balance between creativity and functionality to fostering a culture of feedback and inclusivity, the key to success lies in focusing on the human element. In a rapidly evolving field, let's stay current with technology and always design with heart.",
      "title": "You will get wondrous UX UI design",
      "price": "\$600",
      "images":
          "https://fiverr-res.cloudinary.com/images/t_main1,q_auto,f_auto,q_auto,f_auto/gigs/324310248/original/e7ddb37ba63642e0970372450d4f95108c091a7a/do-mobile-app-and-website-ui-ux-design-with-modern-look.png",
    },
  ];

  /// **********************************************
  /// LIFE CYCLE METHODS
  /// **********************************************

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          FractionallySizedBox(
            alignment: Alignment.topCenter,
            heightFactor: 0.7,
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/profile2.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          FractionallySizedBox(
            alignment: Alignment.bottomCenter,
            heightFactor: 0.3,
            child: Container(
              color: Colors.white,
            ),
          ),

          /// Sliding Panel
          SlidingUpPanel(
            controller: _panelController,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(32),
              topLeft: Radius.circular(32),
            ),
            minHeight: MediaQuery.of(context).size.height * 0.35,
            maxHeight: MediaQuery.of(context).size.height * 0.85,
            body: GestureDetector(
              onTap: () => _panelController.close(),
              child: Container(
                color: Colors.transparent,
              ),
            ),
            panelBuilder: (ScrollController controller) =>
                _panelBody(controller),
            onPanelSlide: (value) {
              if (value >= 0.2) {
                if (!_isOpen) {
                  setState(() {
                    _isOpen = true;
                  });
                }
              }
            },
            onPanelClosed: () {
              setState(() {
                _isOpen = false;
              });
            },
          ),
        ],
      ),
    );
  }

  /// **********************************************
  /// WIDGETS
  /// **********************************************

  /// Panel Body
  SingleChildScrollView _panelBody(ScrollController controller) {
    double hPadding = 40;

    return SingleChildScrollView(
      controller: controller,
      physics: const ClampingScrollPhysics(),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: hPadding),
            height: MediaQuery.of(context).size.height * 0.35,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _titleSection(),
                _infoSection(),
                _actionSection(hPadding: hPadding),
              ],
            ),
          ),
          GridView.builder(
            primary: false,
            shrinkWrap: true,
            padding: const EdgeInsets.all(10),
            itemCount: gridMap.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              mainAxisExtent: 290,
            ),
            itemBuilder: (BuildContext context, int index) => GestureDetector(
                onTap: () {
                  // ****************************
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailPage(
                              images: gridMap[index]['images'],
                              title: gridMap[index]['title'],
                              price: gridMap[index]['price'],
                              description: gridMap[index]['description'] ?? "",
                            )),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      16.0,
                    ),
                    // color: const Color(0xFF7dcffa),
                    gradient: LinearGradient(colors: [
                      Colors.blue[400] ?? Colors.transparent,
                      Colors.blue[300] ?? Colors.transparent,
                      Colors.blue[200] ?? Colors.transparent,
                    ]),
                    // boxShadow: [
                    //   BoxShadow(
                    //     offset: const Offset(0, 0),
                    //     color: Colors.red[100] ?? Colors.transparent,
                    //     blurRadius: 16.0,
                    //   ),
                    //   BoxShadow(
                    //     offset: const Offset(0, 0),
                    //     color: Colors.red[200] ?? Colors.transparent,
                    //     blurRadius: 16.0,
                    //   ),
                    //   BoxShadow(
                    //     offset: const Offset(0, 0),
                    //     color: Colors.red[300] ?? Colors.transparent,
                    //     blurRadius: 16.0,
                    //   ),
                    // ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(16.0),
                          topRight: Radius.circular(16.0),
                        ),
                        child: Image.network(
                          "${gridMap.elementAt(index)['images']}",
                          height: 170,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${gridMap.elementAt(index)['title']}",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .merge(
                                    const TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white,
                                    ),
                                  ),
                            ),
                            const SizedBox(
                              height: 8.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "${gridMap.elementAt(index)['price']}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .merge(
                                        const TextStyle(
                                          fontWeight: FontWeight.w700,
                                          color: Color.fromARGB(
                                              255, 255, 255, 255),
                                        ),
                                      ),
                                ),
                                const CustomLikeButton(),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )),
          )
        ],
      ),
    );
  }

  /// Action Section
  Row _actionSection({required double hPadding}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Visibility(
          visible: !_isOpen,
          child: Expanded(
            child: OutlinedButton(
              onPressed: () => _panelController.open(),
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.blue),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text(
                'VIEW PROFILE',
                style: TextStyle(
                  fontFamily: 'NimbusSanL',
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ),
        Visibility(
          visible: !_isOpen,
          child: const SizedBox(
            width: 16,
          ),
        ),
        Expanded(
          child: Container(
            alignment: Alignment.center,
            child: SizedBox(
              width: _isOpen
                  ? (MediaQuery.of(context).size.width - (2 * hPadding)) / 1.6
                  : double.infinity,
              child: TextButton(
                onPressed: () {
                  // ****************************
                  print('Message tapped');
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  'MESSAGE',
                  style: TextStyle(
                    fontFamily: 'NimbusSanL',
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  /// Info Section
  Row _infoSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          flex: 3,
          child: _infoCell(
            title: 'Posts',
            value: '${gridMap.length}',
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            width: 1,
            height: 40,
            color: Colors.grey,
          ),
        ),
        Expanded(
          flex: 3,
          child: Column(
            children: [
              // const Text(
              //   'Reviews & Ratings',
              //   style: TextStyle(
              //     fontFamily: 'OpenSans',
              //     fontWeight: FontWeight.w300,
              //     fontSize: 14,
              //   ),
              // ),
              GestureDetector(
                onTap: () {
                  // ****************************
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ProductReviewsScreen()));
                },
                child: Image.asset(
                  'images/customer_review.png',
                  width: 55,
                  height: 55,
                  // repeat: false,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            width: 1,
            height: 40,
            color: Colors.grey,
          ),
        ),
        Expanded(flex: 3, child: _infoCell(title: 'Location', value: 'Jordan')),
      ],
    );
  }

  /// Info Cell
  Column _infoCell({required String title, required String value}) {
    return Column(
      children: <Widget>[
        Text(
          title,
          style: const TextStyle(
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.w300,
            fontSize: 14,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          value,
          style: const TextStyle(
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.w700,
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  /// Title Section
  Column _titleSection() {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Sophia Johnson',
              style: TextStyle(
                fontFamily: 'NimbusSanL',
                fontWeight: FontWeight.w700,
                fontSize: 30,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Tooltip(
                message: 'Verified account',
                child: Image.asset(
                  'images/verify1.png',
                  width: 22,
                  height: 22,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        const Text(
          'UI/UX Designer',
          style: TextStyle(
            fontFamily: 'NimbusSanL',
            fontStyle: FontStyle.italic,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
