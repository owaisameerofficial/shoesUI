import 'package:flutter/material.dart';
import 'package:food_delivery/common/color_extension.dart';
import 'package:food_delivery/common_widget/round_textfield.dart';

import '../../common_widget/menu_item_row.dart';
import '../more/my_order_view.dart';
import 'item_details_view.dart';

class MenuItemsView extends StatefulWidget {
  final Map mObj;
  const MenuItemsView({super.key, required this.mObj});

  @override
  State<MenuItemsView> createState() => _MenuItemsViewState();
}

class _MenuItemsViewState extends State<MenuItemsView> {
  TextEditingController txtSearch = TextEditingController();

  List menuItemsArr = [
    {
      "image": "assets/img/slide7.jpg",
      "name": "Nike Store",
      "rate": "4.9",
      "rating": "124",
      "type": "Comfy Medicated ",
      "food_type": "Slide",
      "isFave": false,
    },
    {
      "image": "assets/img/mcq4.jpg",
      "name": "Look Classy With McQueen",
      "rate": "4.9",
      "rating": "124",
      "type": "High Quality Comfort",
      "food_type": "Sneaker",
      "isFave": false,
    },
    {
      "image": "assets/img/jogger6.jpg",
      "name": "Nike Store",
      "rate": "4.9",
      "rating": "124",
      "type": "Jump Run Walk ",
      "food_type": "Joggers",
      "isFave": false,
    },
    {
      "image": "assets/img/af6.jpg",
      "name": "Airfoce ",
      "rate": "4.9",
      "rating": "124",
      "type": "My Pairs",
      "food_type": "Sneakers",
      "isFave": false,
    },
    {
      "image": "assets/img/adslide3.jpg",
      "name": "beyond imagination",
      "rate": "4.9",
      "rating": "124",
      "type": "Slide",
      "food_type": "Slide And slip-on",
      "isFave": false,
    },
    {
      "image": "assets/img/jl1.jpg",
      "name": "Jordan Low",
      "rate": "4.9",
      "rating": "124",
      "type": "Jordan Low 1",
      "food_type": "Sneakers",
      "isFave": false,
    },
    {
      "image": "assets/img/jl3.jpg",
      "name": "joran low",
      "rate": "4.9",
      "rating": "124",
      "type": "joradn 1 low",
      "food_type": "Sneakers",
      "isFave": false,
    },
    {
      "image": "assets/img/jogger2.jpg",
      "name": "Grab it before its gone",
      "rate": "4.9",
      "rating": "124",
      "type": "Nike",
      "food_type": "running",
      "isFave": false,
    },
  ];
  List FavItems = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              const SizedBox(
                height: 46,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Image.asset("assets/img/btn_back.png",
                          width: 20, height: 20),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: Text(
                        widget.mObj["name"].toString(),
                        style: TextStyle(
                            color: TColor.primaryText,
                            fontSize: 20,
                            fontWeight: FontWeight.w800),
                      ),
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
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: RoundTextfield(
                  hintText: "Search Shoes",
                  controller: txtSearch,
                  left: Container(
                    alignment: Alignment.center,
                    width: 30,
                    child: Image.asset(
                      "assets/img/search.png",
                      width: 20,
                      height: 20,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: menuItemsArr.length,
                itemBuilder: ((context, index) {
                  var mObj = menuItemsArr[index] as Map? ?? {};
                  return Column(
                    children: [
                      MenuItemRow(
                          mObj: mObj,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const ItemDetailsView()),
                            );
                          }),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              menuItemsArr[index]["isFave"] =
                                  !menuItemsArr[index]["isFave"];
                              if (menuItemsArr[index]["isFave"] == true) {
                                FavItems.remove(menuItemsArr[index]);
                              } else {
                                FavItems.add(menuItemsArr[index]);
                              }
                            });
                          },
                          icon: Icon(
                            Icons.favorite,
                            color: menuItemsArr[index]["isFave"]
                                ? Colors.red
                                : Colors.grey,
                          )),
                    ],
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
