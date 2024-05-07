import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:readmore/readmore.dart';

class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),

      /// Appbar
      appBar: AppBar(
        title: const Text(
          'Reviews & Ratings',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),

      /// Body
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  "Ratings and Reviews are verified and are fram people who use the same type of device that you use."),
              SizedBox(height: 20),

              /// Overall Product Rating
              TOverallProductRating(),
              TRatingBarlndicator(rating: 3.5),
              Text(
                "12.611",
                style: TextStyle(fontSize: 12),
              ),
              SizedBox(height: 30),

              /// User Review List
              UserReviewCard(),
              UserReviewCard(),
              UserReviewCard(),
            ],
          ),
        ),
      ),
    );
  }
}

class TOverallProductRating extends StatelessWidget {
  const TOverallProductRating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
            flex: 3,
            child: Text(
              '4.8',
              style: TextStyle(fontSize: 55),
            )),
        Expanded(
          flex: 7,
          child: Column(
            children: [
              TRatingProgresslndicator(text: '5', value: 1.0),
              TRatingProgresslndicator(text: '4', value: 0.8),
              TRatingProgresslndicator(text: '3', value: 0.6),
              TRatingProgresslndicator(text: '2', value: 0.4),
              TRatingProgresslndicator(text: '1', value: 0.2),
            ],
          ),
        )
      ],
    );
  }
}

class TRatingBarlndicator extends StatelessWidget {
  const TRatingBarlndicator({
    super.key,
    required this.rating,
  });

  final double rating;

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      rating: rating,
      itemSize: 20,
      unratedColor: const Color.fromARGB(255, 210, 203, 203),
      itemBuilder: (_, __) => const Icon(
        Icons.star,
        color: Color.fromARGB(255, 39, 42, 223),
      ),
    );
  }
}

class TRatingProgresslndicator extends StatelessWidget {
  const TRatingProgresslndicator({
    super.key,
    required this.text,
    required this.value,
  });

  final String text;
  final double value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 1,
            child: Text(
              text,
              style: const TextStyle(fontSize: 15),
            )),
        Expanded(
          flex: 11,
          child: SizedBox(
            width: 10,
            child: LinearProgressIndicator(
              value: value,
              minHeight: 11,
              backgroundColor: const Color.fromARGB(255, 210, 203, 203),
              borderRadius: BorderRadius.circular(7),
              valueColor: const AlwaysStoppedAnimation(
                  Color.fromARGB(255, 39, 42, 223)),
            ),
          ),
        )
      ],
    );
  }
}

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('images/MillieBobbyBrown.jpg'),
                ),
                SizedBox(width: 10),
                Text(
                  'Millie Bobby Brown',
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_vert),
            ),
          ],
        ),
        const SizedBox(height: 10),

        /// Review
        const Row(
          children: [
            TRatingBarlndicator(rating: 4),
            SizedBox(width: 10),
            Text('01 Nov, 2024'),
          ],
        ),
        const SizedBox(height: 10),
        const ReadMoreText(
          'The user interface of the app is quite intuitive. I was able to navigate and make purchases seamlessly. Great job!',
          trimLines: 2,
          trimMode: TrimMode.Line,
          trimExpandedText: ' show less',
          trimCollapsedText: ' show more',
          moreStyle: TextStyle(
              fontSize: 14, fontWeight: FontWeight.bold, color: Colors.blue),
          lessStyle: TextStyle(
              fontSize: 14, fontWeight: FontWeight.bold, color: Colors.blue),
        ),
        const SizedBox(height: 10),

        /// company Review
        Container(
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 210, 203, 203),
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: const Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '%APP_NAME% team',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '02 Nov, 2024',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                ReadMoreText(
                  'The user interface of the app is quite intuitive. I was able to navigate and make purchases seamlessly. Great job!',
                  trimLines: 2,
                  trimMode: TrimMode.Line,
                  trimExpandedText: ' show less',
                  trimCollapsedText: ' show more',
                  moreStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                  lessStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}
