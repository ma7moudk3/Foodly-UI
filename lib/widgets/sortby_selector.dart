import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SortBySelector extends StatefulWidget {
  @override
  _SortBySelectorState createState() => _SortBySelectorState();
}

class _SortBySelectorState extends State<SortBySelector> {
  int selectedIndex = 0;
  final List<String> categories = ['Most Popular', 'Deliviery Time', 'Rating'];
  final List<String> selectedIcons = [
    'images/selected_most_icon.svg',
    'images/selected_delivery_icon.svg',
    'images/selected_rating_icon.svg'
  ];
  final List<String> icons = [
    'images/most_icon.svg',
    'images/delivery_icon.svg',
    'images/rating_icon.svg'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.22,
      child: ListView.builder(
          itemCount: categories.length,
          itemBuilder: (BuildContext context, int index) => GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                child: ListTile(
                    leading: index == selectedIndex
                        ? SvgPicture.asset(selectedIcons[index])
                        : SvgPicture.asset(icons[index]),
                    title: Text(
                      categories[index],
                      style: TextStyle(
                        fontSize: 16,
                        color: index == selectedIndex
                            ? const Color(0xffffca40)
                            : const Color(0xff464545),
                        height: 1.625,
                      ),
                      textAlign: TextAlign.left,
                    )),
              )),
    );
  }
}
