import 'package:flutter/material.dart';
import 'package:login_ui/widget/custom_textfiel.dart';
import 'package:login_ui/widget/primary_button.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isHidden = true;
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

              Center(child: Icon(Icons.lock, size: 80, color: Colors.blue)),

              SizedBox(height: 15),

              CustomTextfield(label: "email"),

              SizedBox(height: 15),

              CustomTextfield(
                label: "password",
                obscureText: isHidden,
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

              SizedBox(height: 15),

              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text("forget password"),
                ),
              ),

              SizedBox(height: 15),

              PrimaryButton(text: "Login", onPressed: () {}),

              SizedBox(height: 15),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("dont have an account"),
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
    );
  }
}
