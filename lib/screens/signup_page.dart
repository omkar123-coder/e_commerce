import 'package:e_commerce/screens/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final formKey = GlobalKey<FormState>();

  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  void signUp() {
    if (formKey.currentState!.validate()) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginPage(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                controller: email,
                decoration: const InputDecoration(labelText: "Email"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter a valid email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: phone,
                obscureText: false,
                decoration:
                    const InputDecoration(labelText: "Enter the mobile Number"),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                ],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter a Number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: date,
                decoration: InputDecoration(labelText: 'Enter the Date'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Enter the date';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: age,
                decoration: InputDecoration(labelText: 'Enter the Age'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter the age';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: password,
                decoration: InputDecoration(labelText: 'Enter the password'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter the Password';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: confirmPassword,
                decoration:
                    InputDecoration(labelText: 'Enter Confirm Password'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter Confirm Password';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                onPressed: signUp,
                child: const Text("Login"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
