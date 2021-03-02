import 'dart:async';

import 'package:flutter/material.dart';
import 'package:foodly_test/widgets/price_range_selector.dart';
import 'package:foodly_test/widgets/sortby_selector.dart';

class FilterScreen extends StatefulWidget {
  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  double height = 0;

  void initState() {
    super.initState();
    Timer(Duration(seconds: 0), () {
      setState(() {
        height = MediaQuery.of(context).size.height * 0.65;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          AnimatedContainer(
            duration: Duration(milliseconds: 1500),
            curve: Curves.fastLinearToSlowEaseIn,
            height: height,
            decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25))),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 15),
                    child: sctionTitle("Sorty by"),
                  ),
                  SortBySelector(),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 22),
                    child: sctionTitle('Price Range'),
                  ),
                  PriceRangeSelector(),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 22),
                    child: sctionTitle('Categories'),
                  ),
                  PriceRangeSelector(
                    iscategories: true,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
              flex: 2,
              child: Stack(
                children: [
                  Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 120,
                      color: Colors.black,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.shopping_bag,
                              color: Colors.white,
                            ),
                            Image.asset(
                              'images/images.png',
                              width: 130,
                            ),
                            Text(
                              'SAR 14.75',
                              style: TextStyle(
                                fontSize: 16,
                                color: const Color(0xffffffff),
                                letterSpacing: -0.5,
                                fontWeight: FontWeight.w700,
                              ),
                              textAlign: TextAlign.right,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Image.asset(
                        'images/backgroun.png',
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }

  Row sctionTitle(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 24,
            color: const Color(0xffffffff),
          ),
          textAlign: TextAlign.left,
        ),
        Icon(
          Icons.more_horiz,
          color: Colors.white,
        ),
      ],
    );
  }
}
