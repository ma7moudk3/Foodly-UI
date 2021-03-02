import 'package:flutter/material.dart';

class PriceRangeSelector extends StatefulWidget {
  final bool iscategories;

  const PriceRangeSelector({this.iscategories = false});
  @override
  _PriceRangeSelectorState createState() => _PriceRangeSelectorState();
}

class _PriceRangeSelectorState extends State<PriceRangeSelector> {
  int selectedIndex = 0;
  final List<String> categories = ['\$', '\$\$', '\$\$\$'];
  final List<String> categories2 = ['Burgers', 'America Food', 'Mexican'];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.05,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (BuildContext context, int index) => GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                height: MediaQuery.of(context).size.height * 0.05,
                padding: EdgeInsets.symmetric(horizontal: 5),
                width: 95,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: selectedIndex == index
                        ? Theme.of(context).primaryColor
                        : Color(0xFF949494)),
                child: // Adobe XD layer: '$' (text)
                    Center(
                  child: Text(
                    widget.iscategories
                        ? categories2[index]
                        : categories[index],
                    style: TextStyle(
                      fontSize: 15,
                      color: selectedIndex == index
                          ? Colors.black
                          : const Color(0xffffffff),
                      letterSpacing: -0.5,
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ))),
    );
  }
}
