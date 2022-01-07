import 'package:conversor_curso/app/models/currency_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CurrencyBox extends StatelessWidget {
  final List<CurrencyModel> items;
  final CurrencyModel selectedItem;
  final TextEditingController controller;
  final void Function(CurrencyModel?)? onChanged;

  const CurrencyBox(
      {Key? key,
      required this.items,
      required this.controller,
      required this.selectedItem,
      required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Expanded(
          child: SizedBox(
        height: 56,
        child: DropdownButton<CurrencyModel>(
          value: selectedItem,
          isExpanded: true, // joga a setinha no final do campo
          underline: Container(height: 1, color: Colors.amber),
          items: items
              .map((e) => DropdownMenuItem<CurrencyModel>(
                    child: Text(e.name),
                    value: e,
                  ))
              .toList(),
          onChanged: onChanged,
          iconEnabledColor: Colors.amber,
        ),
      )),
      SizedBox(width: 10),
      Expanded(
        flex: 2,
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.amber)),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.amber))),
        ),
      ),
    ]);
  }
}
