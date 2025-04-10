
import 'package:baas/firebase_services.dart';
import 'package:baas/login_page.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPage> {
  late final TextEditingController _emailController;
  late final TextEditingController _passController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final FirebaseServices _firebaseServices = FirebaseServicesImpl();

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
                    onPressed: () async{
                      if (_formKey.currentState!.validate()) {
                        print('Form is Validated');
                        final register  = await _firebaseServices.register(email: _emailController.text.trim().toLowerCase(), 
                        password: _passController.text.trim());

                        register.fold((Error) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: Colors.red,
                            behavior: SnackBarBehavior.floating,
                            content: Text(Error),));
                          
                        }, (response) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('SucessFull !'),
                            backgroundColor: Colors.green,
                            behavior: SnackBarBehavior.floating,));
                        },);

                        
                      }
                    },
                    child: Text('Register')),
                SizedBox(
                  height: 24,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                    child: Text("Already a user ? Login"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
