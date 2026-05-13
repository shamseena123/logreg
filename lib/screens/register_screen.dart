import 'package:flutter/material.dart';
import 'package:login_ui/widget/custom_textfiel.dart';
import 'package:login_ui/widget/primary_button.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isPasswordHidden = true;
  bool isConfirmHidden = true;

  final _formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

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

                Center(
                  child: Text(
                    "Create a account",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),

                SizedBox(height: 15),

                CustomTextField(
                  label: "name",
                  controller: nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Name is required";
                    }
                    return null;
                  },
                ),

                SizedBox(height: 15),

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

                SizedBox(height: 15),

                CustomTextField(
                  label: "phone",
                  controller: phoneController,

                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Password is required";
                    }

                    if (value.length < 10) {
                      return "Password must be minimum 10 numbers";
                    }

                    return null;
                  },
                ),

                SizedBox(height: 15),
                CustomTextField(
                  label: "password",
                  controller: passwordController,
                  obscureText: isPasswordHidden,
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
                      isPasswordHidden
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        isPasswordHidden = !isPasswordHidden;
                      });
                    },
                  ),
                ),

                SizedBox(height: 15),

                CustomTextField(
                  label: " confirm password",
                  controller: confirmPasswordController,
                  obscureText: isConfirmHidden,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return " Confrim Password is required";
                    }

                    if (value != passwordController.text) {
                      return "Password do not match";
                    }

                    return null;
                  },
                  suffixIcon: IconButton(
                    icon: Icon(
                      isConfirmHidden ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        isConfirmHidden = !isConfirmHidden;
                      });
                    },
                  ),
                ),

                SizedBox(height: 15),

                isLoading
                    ? Center(child: CircularProgressIndicator())
                    : PrimaryButton(
                        text: "Register",
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
                              SnackBar(
                                content: Text("Registration Successful"),
                              ),
                            );

                            Navigator.pushNamed(context, '/login');
                          }
                        },
                      ),

                SizedBox(height: 15),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Already have an account?"),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/login');
                      },
                      child: Text("Login"),
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
