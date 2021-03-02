import 'package:flutter/material.dart';

class CustonListTile extends StatefulWidget {
  bool checkedValue = false;
  final String title;
  final double price;

  CustonListTile({this.title, this.price});

  @override
  _CustonListTileState createState() => _CustonListTileState();
}

class _CustonListTileState extends State<CustonListTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.only(right: 32.0, left: 20),
      dense: true,
      onTap: () {
        setState(() {
          widget.checkedValue = !widget.checkedValue;
        });
      },
      leading: Checkbox(
          activeColor: Color(0xFFC8171D),
          value: widget.checkedValue,
          onChanged: (bool value) {
            print('checked $value');
            widget.checkedValue = value;
            print('checkedValue : $widget.checkedValue ');
            setState(() {});
          }),
      title: Text(
        widget.title,
        style: TextStyle(
          fontSize: 16,
          color: const Color(0xff5e5e5e),
          height: 1.625,
        ),
        textAlign: TextAlign.left,
      ),
      trailing: // Adobe XD layer: '$1.50' (text)
          Text(
        'SAR ${widget.price.toString()}',
        style: TextStyle(
          fontSize: 16,
          color: Colors.black,
          letterSpacing: -0.5,
          fontWeight: FontWeight.w700,
        ),
        textAlign: TextAlign.right,
      ),
    );
  }
}
