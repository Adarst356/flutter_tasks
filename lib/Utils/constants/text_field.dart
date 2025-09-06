import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final IconData? prefixIcon;
  final bool isPassword;
  final bool? isVisible;
  final void Function()? toggleVisibility;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.label,
    required this.hint,
    this.prefixIcon,
    this.isPassword = false,
    this.isVisible,
    this.toggleVisibility,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: isPassword ? (isVisible ?? true) : false,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        prefixIcon: prefixIcon == null ? null : Icon(prefixIcon),
        suffixIcon: isPassword
            ? IconButton(
          icon: Icon(
            isVisible! ? Icons.visibility_off_outlined : Icons.visibility_outlined,
          ),
          onPressed: toggleVisibility,
        )
            : null,
      ),
    );
  }
}
