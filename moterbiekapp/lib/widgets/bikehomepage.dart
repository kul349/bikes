// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BikeHomePage extends StatefulWidget {
  const BikeHomePage({super.key});

  @override
  State<BikeHomePage> createState() => _BikeHomePageState();
}

class _BikeHomePageState extends State<BikeHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bikes"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: Text(
                "Categories",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            CategoryChooser(
              onTop: (Category) => Navigator.pushNamed(
                  context, "category_bikes",
                  arguments: Category),
            ),
            const SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Card(
                child: Container(
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.0),
                    color: Colors.indigo,
                  ),
                  child: Swiper(
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          const SizedBox(width: 20.0),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  "Buy, Sell, Exchange",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0,
                                  ),
                                ),
                                Text(
                                  "All in One Place",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 10.0),
                          CircleAvatar(
                            backgroundColor: Colors.indigo.shade800,
                            radius: 50.0,
                            child: const Icon(
                              FontAwesomeIcons.moneyBill,
                              size: 30,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(width: 20.0),
                        ],
                      );
                    },
                    itemCount: 2,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Text(
                    "Recent Posts",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "View All",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}

class CategoryChooser extends StatelessWidget {
  final Function(String)? onTop;
  const CategoryChooser({
    Key? key,
    this.onTop,
  }) : super(key: key);
  final List<String> types = const [
    "standard",
    "Cruiser",
    "Sport",
    "Dirt",
    "Scooter",
    "Electric"
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 100,
        child: ListView.separated(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              String type = types[index];
              return GestureDetector(
                onTap: onTop != null ? () => onTop!(type) : null,
                child: Column(
                  children: [
                    Container(
                      width: 60.0,
                      height: 60.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                "https://imgd.aeplcdn.com/1056x594/n/cw/ec/53743/42-right-front-three-quarter-3.jpeg?isig=0&q=80&wm=3"),
                            fit: BoxFit.cover),
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Text(type,
                        style: const TextStyle(fontWeight: FontWeight.w500))
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(
                  width: 10.0,
                ),
            itemCount: types.length));
  }
}
