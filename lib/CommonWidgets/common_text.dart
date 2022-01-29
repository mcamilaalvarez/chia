import 'package:flutter/material.dart';

class CommonText extends StatelessWidget {
  final String text;

  const CommonText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child:
          Text(text, style: TextStyle(color: Theme.of(context).primaryColor)),
    );
  }
}
