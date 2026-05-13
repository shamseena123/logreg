import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final bool obscureText;
  final Widget? suffixIcon;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const CustomTextField({
    super.key,
    required this.label,
    this.obscureText = false,
    this.suffixIcon,
    this.keyboardType = TextInputType.text,
    required this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      validator: validator,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
        suffixIcon: suffixIcon,
      ),
    );
  }
}
