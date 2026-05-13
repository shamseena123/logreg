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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(30),
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

              CustomTextfield(label: "name"),

              SizedBox(height: 15),

              TextField(
                decoration: InputDecoration(
                  labelText: "email",
                  border: OutlineInputBorder(),
                ),
              ),

              SizedBox(height: 15),

              CustomTextfield(
                label: "phone",
                keyboardType: TextInputType.phone,
              ),

              SizedBox(height: 15),

              TextField(
                obscureText: isPasswordHidden,
                decoration: InputDecoration(
                  labelText: "Enter password",
                  border: OutlineInputBorder(),
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
              ),

              SizedBox(height: 15),

              TextField(
                obscureText: isConfirmHidden,
                decoration: InputDecoration(
                  labelText: "confirm password",
                  border: OutlineInputBorder(),
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
              ),

              SizedBox(height: 15),

              PrimaryButton(text: "Register", onPressed: () {}),

              SizedBox(height: 15),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Already have an account"),
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
    );
  }
}
