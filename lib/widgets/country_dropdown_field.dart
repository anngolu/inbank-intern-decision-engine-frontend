import 'package:flutter/material.dart';

import '../colors.dart'; // Assuming you have a predefined AppColors class

// A custom dropdown button form field widget for country selection
class CountryDropdownFormField extends StatelessWidget {
  // Properties for initial value and event handler when the value changes
  final String? initialValue;
  final void Function(String?)? onChanged;

  const CountryDropdownFormField({
    Key? key,
    this.initialValue,
    this.onChanged,
  }) : super(key: key);

  // List of dropdown menu items
  final List<DropdownMenuItem<String>> _dropdownMenuItems = const [
    DropdownMenuItem(value: "EE", child: Text("Estonia")),
    DropdownMenuItem(value: "LV", child: Text("Latvia")),
    DropdownMenuItem(value: "LT", child: Text("Lithuania")),
  ];

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      value: initialValue, // Initial selected value
      style: const TextStyle(color: AppColors.textColor), // Text style
      decoration: const InputDecoration(
        labelText: 'Select Country',
        labelStyle: TextStyle(color: AppColors.textColor),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.primaryColor),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.primaryColor),
        ),
      ),
      dropdownColor: AppColors.defaultColor,
      items: _dropdownMenuItems,
      onChanged: onChanged,
      icon: const Icon(Icons.arrow_drop_down, color: AppColors.textColor),
      iconSize: 24,
      elevation: 16,
      // Set autovalidate mode to trigger validation on user interaction
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please select a country.';
        }
        return null;
      },
    );
  }
}
