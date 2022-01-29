import 'package:flutter/material.dart';

class CommonDropdownButton extends StatefulWidget{
  final  String wordButton;
  final List<String> items;

  const CommonDropdownButton({Key? key, required this.wordButton, required this.items}) : super(key: key);


  @override
  State<CommonDropdownButton> createState() => _CommonDropdownButtonState();
}

class _CommonDropdownButtonState extends State<CommonDropdownButton> {
  @override
  bool status = false;
  List<String> dropdownItems = [

  ];


  List<DropdownMenuItem<String>> _setList() {
    dropdownItems = widget.items;
    return dropdownItems
        .map<DropdownMenuItem<String>>(
          (e) => DropdownMenuItem(
        value: e,
        child: Text(
          e,
          style: TextStyle(color: Colors.white, fontSize: 14),
        ),
      ),
    )
        .toList();
  }

  String dropdownValue = '';

  Widget build(BuildContext context) {
    dropdownValue = widget.items[0];
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);

    return Container(
      height: 45,
      decoration: BoxDecoration(
          color: Theme.of(context).backgroundColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: (status)
                ? Theme.of(context).buttonColor
                : Theme.of(context).primaryColor,
          )),
      child: Padding(
        padding: (queryData.size.width > 600) ? EdgeInsets.fromLTRB(8, 3, 5, 0) :EdgeInsets.fromLTRB(8, 3, 0, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Theme(
              data: Theme.of(context)
                  .copyWith(canvasColor: Theme.of(context).backgroundColor),
              child: Container(
                width: (queryData.size.width > 600) ? queryData.size.width * 0.90 :queryData.size.width * 0.815,
                child: DropdownButton<String>(
                  isExpanded: true,
                  underline: Container(),
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  value: dropdownValue,
                  icon: Row(
                    children: [
                      Text( widget.wordButton, style: TextStyle(color: Theme.of(context).primaryColor ),),
                      Icon( Icons.keyboard_arrow_right , color: Theme.of(context).primaryColor,)
                    ],
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                    });
                  },
                  items: _setList(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}