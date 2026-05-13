import 'package:flutter/material.dart';
import 'package:login_ui/widget/custom_textfiel.dart';
import 'package:login_ui/widget/primary_button.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isHidden = true;

  final _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30),

                Center(child: Icon(Icons.lock, size: 80, color: Colors.blue)),

                SizedBox(height: 20),

                // EMAIL FIELD
                CustomTextField(
                  label: "email",
                  controller: emailController,

                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Email is required";
                    }

                    if (!value.contains("@")) {
                      return "Enter valid email";
                    }

                    return null;
                  },
                ),

                SizedBox(height: 20),

                CustomTextField(
                  label: "password",
                  controller: passwordController,
                  obscureText: isHidden,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Password is required";
                    }

                    if (value.length < 6) {
                      return "Password must be minimum 6 characters";
                    }

                    return null;
                  },
                  suffixIcon: IconButton(
                    icon: Icon(
                      isHidden ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        isHidden = !isHidden;
                      });
                    },
                  ),
                ),

                SizedBox(height: 10),

                // FORGOT PASSWORD
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: Text("Forgot Password"),
                  ),
                ),

                SizedBox(height: 20),

                // LOGIN BUTTON
                isLoading
                    ? Center(child: CircularProgressIndicator())
                    : PrimaryButton(
                        text: "Login",
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              isLoading = true;
                            });

                            await Future.delayed(Duration(seconds: 2));

                            setState(() {
                              isLoading = false;
                            });

                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Login Successful")),
                            );

                            Navigator.pushNamed(context, '/register');
                          }
                        },
                      ),

                SizedBox(height: 20),

                // REGISTER NAVIGATION
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account? "),

                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/register');
                      },
                      child: Text("Register"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
