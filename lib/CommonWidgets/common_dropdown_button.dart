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
  String dropdownValue =  '';

  void initState() {
    dropdownValue = widget.items[0];
    super.initState();
  }

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


  Widget build(BuildContext context) {

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
        padding: const EdgeInsets.fromLTRB(10, 5, 8, 0),
        child: Theme(
          data: Theme.of(context)
              .copyWith(canvasColor: Theme.of(context).backgroundColor),
          child: Container(
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
        ),
      ),
    );
  }
}