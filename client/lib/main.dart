import 'package:flutter/material.dart';
import 'package:sur/core/theme/theme.dart';
import 'package:sur/features/auth/view/pages/signup_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SUR',
      theme: AppTheme.darkThemeMode,
      home: const SignupPage(),
    );
  }
}
