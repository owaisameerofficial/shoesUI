import 'package:flutter/material.dart';
import 'package:food_delivery/common/color_extension.dart';
import 'package:food_delivery/common_widget/round_button.dart';

import '../../common_widget/popular_resutaurant_row.dart';
import '../more/my_order_view.dart';

class OfferView extends StatefulWidget {
  const OfferView({super.key});

  @override
  State<OfferView> createState() => _OfferViewState();
}

class _OfferViewState extends State<OfferView> {
  TextEditingController txtSearch = TextEditingController();

  List offerArr = [
    {
      "image": "assets/img/slide10.jpg",
      "name": "Slide",
      "rate": "4.9",
      "rating": "124",
      "type": "Slides",
      "food_type": "Footwear"
    },
    {
      "image": "assets/img/af4.jpg",
      "name": "Airforce",
      "rate": "4.9",
      "rating": "124",
      "type": "Sneaker",
      "food_type": "Footwear"
    },
    {
      "image": "assets/img/jl1.jpg",
      "name": "jordan low ",
      "rate": "4.9",
      "rating": "124",
      "type": "Sneaker",
      "food_type": "Footwear"
    },
    {
      "image": "assets/img/jogger9.jpg",
      "name": "Airmax",
      "rate": "4.9",
      "rating": "124",
      "type": "Running",
      "food_type": "Footwear"
    },
    {
      "image": "assets/img/mcq4.jpg",
      "name": "Alexander McQueen",
      "rate": "4.9",
      "rating": "124",
      "type": "Sneaker",
      "food_type": "Footwear"
    },
    {
      "image": "assets/img/mcq3.jpg",
      "name": "Mcqueen",
      "rate": "4.9",
      "rating": "124",
      "type": "Gyming & Running",
      "food_type": "Footwear"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 46,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Latest Offers",
                      style: TextStyle(
                          color: TColor.primaryText,
                          fontSize: 20,
                          fontWeight: FontWeight.w800),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MyOrderView()));
                      },
                      icon: Image.asset(
                        "assets/img/shopping_cart.png",
                        width: 25,
                        height: 25,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Find discounts, Offers special\nDiscount and more!",
                      style: TextStyle(
                          color: TColor.secondaryText,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  width: 140,
                  height: 30,
                  child: RoundButton(
                      title: "check Offers", fontSize: 12, onPressed: () {}),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: offerArr.length,
                itemBuilder: ((context, index) {
                  var pObj = offerArr[index] as Map? ?? {};
                  return PopularRestaurantRow(
                    pObj: pObj,
                    onTap: () {},
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
