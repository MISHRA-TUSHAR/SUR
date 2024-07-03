import 'package:flutter/material.dart';
import 'package:sur/core/theme/app_pallete.dart';
import 'package:sur/core/widgets/customfield.dart';
import 'package:sur/features/auth/view/pages/login.dart';
import 'package:sur/features/auth/view/widgets/auth_btn.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 100,
                ),
                const Text(
                  'Sign Up.',
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 30),
                CustomField(
                  hintText: 'Name',
                  controller: nameController,
                ),
                const SizedBox(height: 15),
                CustomField(
                  hintText: 'Email',
                  controller: emailController,
                ),
                const SizedBox(height: 15),
                CustomField(
                  hintText: 'Password',
                  controller: passwordController,
                  isObscureText: true,
                ),
                const SizedBox(height: 20),
                AuthGradientButton(
                  buttonText: 'Sign up',
                  onTap: () {},
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ),
                    );
                  },
                  child: RichText(
                    text: TextSpan(
                      text: 'Already have an account? ',
                      style: Theme.of(context).textTheme.titleMedium,
                      children: const [
                        TextSpan(
                          text: 'Sign In',
                          style: TextStyle(
                            color: Pallete.gradient2,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
