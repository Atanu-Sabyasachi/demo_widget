// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

typedef DoubleStringParamCallback<T, E> = Function(T first, E second);

class LogIn extends StatelessWidget {
  LogIn({
    Key? key,
    required this.onLoginPressed,
  }) : super(key: key);

  //final VoidCallback? onTap;
  final DoubleStringParamCallback onLoginPressed;
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            height: 300,
            width: 600,
            image: AssetImage('assets/images/login.png'),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Login',
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 20),
          TextFormField(
            textInputAction: TextInputAction.next,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return ("Please Enter Your Email");
              }

              if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                  .hasMatch(value)) {
                return ("Please Enter a valid email");
              }
              return null;
            },
            onSaved: (value) {
              emailcontroller.text = value!;
            },
            controller: emailcontroller,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(15),
              hintText: 'Email Id',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
          SizedBox(height: 20),
          TextFormField(
            autofocus: false,
            controller: passwordcontroller,
            obscureText: true,
            validator: (value) {
              RegExp regex = RegExp(r'^.{6,}$');
              if (value!.isEmpty) {
                return ("Password is required for login");
              }
              if (!regex.hasMatch(value)) {
                return ("Enter Valid Password(Min. 6 Character)");
              }
              return null;
            },
            onSaved: (value) {
              passwordcontroller.text = value!;
            },
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(15),
              hintText: 'Password',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
          SizedBox(height: 30),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(Color.fromARGB(255, 231, 204, 1)),
            ),
            onPressed: () =>
                onLoginPressed(emailcontroller.text, passwordcontroller.text),
            child: Text('Login'),
          ),
        ],
      ),
    );
  }
}
