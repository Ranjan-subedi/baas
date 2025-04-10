

import 'package:baas/register_paage.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final TextEditingController _emailController;
  late final TextEditingController _passController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _emailController = TextEditingController();
    _passController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: _emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'This field is required';
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(border: OutlineInputBorder()),
                ),
                SizedBox(height: 24),
                TextFormField(
                  controller: _passController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'This field is required';
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(border: OutlineInputBorder()),
                ),
                SizedBox(height: 24),
                ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        print('Form is Validated');
                      }
                    },
                    child: Text('Login')),
                SizedBox(
                  height: 24,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => RegisterPage()));
                    },
                    child: Text("Not yet registered ? Register"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
