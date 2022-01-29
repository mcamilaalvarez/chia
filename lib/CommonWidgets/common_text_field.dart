import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:prueba_chia/CommonWidgets/common_dropdown_button.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class commonTextField extends StatefulWidget {
  final String text;
  final String type;

  const commonTextField({Key? key, required this.text, required this.type})
      : super(key: key);

  @override
  State<commonTextField> createState() => _commonTextFieldState();
}

class _commonTextFieldState extends State<commonTextField> {
  final myController = TextEditingController();
  List<String> itemsCountry = [
    'Colombia',
    'Argentina',
    'Uruguay',
    'Ecuador',
    'Mexico'
  ];
  List<String> itemsLanguage = [
    'Español',
    'Inglés',
    'Alemán',
    'Portuges',
  ];
  List<String> itemsDevices = [
    'Samsung Galaxy SE',
    'Laptop ',
    'Device 3',
    'Device 4',
  ];
  DateTime selectedDate = DateTime.now();

  _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate, // Refer step 1
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  // types : text, phoneNumber, select, country, password, devices, date, language
  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  Widget _textField(BuildContext context, type) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    Widget field = Container();

    switch (type) {
      case 'text':
        field = TextField(
          controller: myController,
          style: const TextStyle(color: Colors.white),
          decoration: defaultDecoration(context, null),
        );
        break;
      case 'phoneNumber':
        field = IntlPhoneField(
          style: const TextStyle(color: Colors.white),
          decoration: defaultDecoration(context, null),
          initialCountryCode: 'CO',
          dropdownTextStyle: const TextStyle(color: Colors.white),
        );
        break;
      case 'country':
        field = CommonDropdownButton(wordButton: 'Seleccionar', items: itemsCountry,);

        break;
      case 'password':
        field = TextField(
          controller: myController,
          obscureText: isObscureText,
          style: const TextStyle(
            color: Colors.white,
          ),
          decoration: defaultDecoration(
              context,
               IconButton(
                  onPressed: (){
                    setState(() {
                      isObscureText = !isObscureText;
                    });
                  },
                  icon: ImageIcon(AssetImage('assets/icons/password.png'),
                      color: Color(0xff789D9E)))),
        );
        break;
      case 'devices':
        field = CommonDropdownButton(wordButton: 'Cambiar', items:itemsDevices);
        break;
      case 'date':
        field = Container(
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
            padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(  "${selectedDate.toLocal()}".split(' ')[0],
                    style: TextStyle(
                      color: Colors.white
                    )),
                TextButton(child: Row(
                  children: [
                    Text( 'Editar', style: TextStyle(color: Theme.of(context).primaryColor ),),
                    Icon( Icons.keyboard_arrow_right , color: Theme.of(context).primaryColor,)
                  ],
                ), onPressed: (){
                  _selectDate(context);
                },)

            ],
            ),
          ),
        );
        break;
      case 'language':
        field = CommonDropdownButton(wordButton: 'Cambiar', items:itemsLanguage);
        break;

      default:
        return Container();
    }
    return field;
  }

  bool status = false;
  bool isObscureText = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: (widget.type != 'select')
          ? Stack(
              children: [
                Padding(
                    padding: (widget.type == 'phoneNumber')
                        ? const EdgeInsets.fromLTRB(0, 7, 0, 0)
                        : const EdgeInsets.fromLTRB(0, 1, 0, 0),
                    child: _textField(context, widget.type)),
                Padding(
                  padding:  (widget.type == 'phoneNumber') ? EdgeInsets.fromLTRB(9, 7, 0, 0) : EdgeInsets.fromLTRB(9, 5, 0, 0),
                  child: Text(
                    widget.text,
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            )
          : Container(
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
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(widget.text,
                        style: TextStyle(
                          color: (status)
                              ? Colors.white
                              : Theme.of(context).primaryColor,
                        )),
                    FlutterSwitch(
                        activeText: '',
                        inactiveText: '',
                        inactiveColor: Theme.of(context).primaryColor,
                        activeColor: Theme.of(context).buttonColor,
                        toggleColor: Theme.of(context).backgroundColor,
                        width: 26.0,
                        height: 11.0,
                        valueFontSize: 20.0,
                        toggleSize: 16.0,
                        value: status,
                        borderRadius: 30.0,
                        padding: 1,
                        showOnOff: true,
                        onToggle: (val) {
                          setState(() {
                            status = val;
                          });
                        }),
                  ],
                ),
              ),
            ),
    );
  }
}

InputDecoration defaultDecoration(BuildContext context, suffixIcon) {
  return InputDecoration(
    filled: true,
    fillColor: Theme.of(context).backgroundColor,
    border: OutlineInputBorder(
        borderSide:
            BorderSide(color: Theme.of(context).primaryColor, width: 2.0)),
    contentPadding: const EdgeInsets.all(10.0),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Theme.of(context).buttonColor,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Theme.of(context).primaryColor,
      ),
    ),
    suffixIcon: suffixIcon,
    suffixIconColor: Theme.of(context).primaryColor,
  );
}
