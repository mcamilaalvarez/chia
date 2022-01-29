import 'package:flutter/material.dart';

import 'package:prueba_chia/CommonWidgets/common_text_field.dart';

class menuD extends StatefulWidget {
  final String name;
  final AssetImage icon;
  final Widget contentTile;

  const menuD({
    Key? key,
    required this.name,
    required this.icon, required this.contentTile,
  }) : super(key: key);

  @override
  State<menuD> createState() => _menuDState();
}

class _menuDState extends State<menuD> {
  bool _customTileExpanded = false;

  @override
  Widget build(BuildContext context) {

    return ExpansionTile(
      title: Text(widget.name),
      leading: ImageIcon(widget.icon),
      collapsedTextColor: Colors.white,
      collapsedIconColor: Colors.white,
      textColor: Theme.of(context).buttonColor,
      iconColor: Theme.of(context).buttonColor,
      onExpansionChanged: (bool expanded) {
        setState(() => _customTileExpanded = expanded);
      },
      trailing: Icon((_customTileExpanded)
          ? Icons.keyboard_arrow_down_rounded
          : Icons.keyboard_arrow_right),
      children: [ListTile( title: widget.contentTile, )],
    );
  }
}

