import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:foodly_test/screens/filter_screen.dart';
import 'package:foodly_test/widgets/animated_counter.dart';
import 'package:foodly_test/widgets/custom_list_tile.dart';

class MealDetailsScreen extends StatefulWidget {
  @override
  _MealDetailsScreenState createState() => _MealDetailsScreenState();
}

class _MealDetailsScreenState extends State<MealDetailsScreen> {
  var checkedValue = false;
  var quantity = 1;
  var price = 13.74;
  double finalPrice = 13.74;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.scaffoldBackgroundColor,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            Icons.arrow_back_rounded,
            color: Colors.black,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.favorite,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                'images/meal_image.png',
              ),
            ),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  height: 29,
                  width: 54,
                  decoration: BoxDecoration(
                    color: theme.accentColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      'NEW',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  height: 29,
                  width: 54,
                  decoration: BoxDecoration(
                    color: theme.accentColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      '350 g',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            Text(
              'فطور سريع التحضير',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: screenHeight * 0.005,
            ),
            // Adobe XD layer: 'A hotel breakfast th' (text)
            Text(
              'وجبة إفطار في الفندق تشمل معظم أو كل ما يلي: بيضتان شرائح لحم مقدد.',
              style: TextStyle(
                fontSize: 16,
                color: const Color(0xff5e5e5e),
                height: 1.625,
              ),
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 32, right: 32, top: 20, bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    height: 40,
                    width: 105,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.grey),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                quantity--;
                                finalPrice = price * quantity;
                              });
                            },
                            child: Icon(
                              Icons.remove,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        AnimatedFlipCounter(
                          duration: Duration(milliseconds: 500),
                          value: quantity,
                          color: Colors.black,
                          size: 18,
                        )
                        // Text(
                        //   quantity.toString(),
                        //   style: TextStyle(
                        //     fontSize: 16,
                        //     color: Colors.black,
                        //     letterSpacing: -0.5,
                        //     fontWeight: FontWeight.w700,
                        //   ),
                        //   textAlign: TextAlign.center,
                        // ),
                        ,
                        Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.black),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                quantity++;
                                finalPrice = price * quantity;
                              });
                            },
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    'SAR ${finalPrice.toString()}',
                    style: TextStyle(
                      fontSize: 24,
                      color: const Color(0xff000000),
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.right,
                  )
                ],
              ),
            ),
            CustonListTile(
              title: 'Extra 2 eggs',
              price: 1.50,
            ),
            CustonListTile(
              title: 'Extra bacon',
              price: 0.90,
            ),
            CustonListTile(
              title: 'Extra sliced brad',
              price: 1.81,
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (ctx) => FilterScreen()));
              },
              child: Container(
                width: double.infinity,
                height: 50,
                margin: EdgeInsets.symmetric(horizontal: 32, vertical: 25),
                child: // Adobe XD layer: 'Add to cart' (text)
                    Center(
                  child: Text(
                    'Add to cart',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 16,
                      color: const Color(0xff000000),
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                decoration: BoxDecoration(
                    color: theme.primaryColor,
                    borderRadius: BorderRadius.circular(50)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
