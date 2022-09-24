import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final formkey = GlobalKey<FormState>();
  final snackbar = const SnackBar(
    content: Text('Details are being saved@b'),
    duration: Duration(seconds: 5),
  );

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
          child: Column(
            children: [
              Form(
                  key: formkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: height * 0.04,
                      ),
                      const Text(
                        'Sign up ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Color(0xFF363f93)),
                      ),
                      const Text(
                        'Get ready to eat !',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Color(0xFF363f93)),
                      ),
                      SizedBox(
                        height: height * 0.05,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Enter your name',
                          suffixIcon: Icon(Icons.person),
                        ),
                        maxLength: 30,
                        validator: ((value) {
                          if (value!.isEmpty ||
                              !RegExp(r"^[a-zA-Z][a-zA-Z\s]{0,100}[a-zA-Z]$")
                                  .hasMatch(value)) {
                            return 'Enter valid name';
                          } else {
                            return null;
                          }
                        }),
                      ),
                      SizedBox(
                        height: height * 0.05,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                            labelText: 'Enter your email',
                            hintText: 'example@babcock.edu.ng',
                            suffixIcon: Icon(Icons.email)),
                        maxLength: 50,
                        validator: ((value) {
                          if (value!.isEmpty ||
                              !RegExp(r"^[A-Za-z0-9._%+-]+@babcock.edu.ng$")
                                  .hasMatch(value)) {
                            return 'Enter valid email';
                          } else {
                            return null;
                          }
                        }),
                      ),
                      SizedBox(
                        height: height * 0.05,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Enter your password',
                          suffixIcon: Icon(Icons.lock),
                        ),
                        maxLength: 18,
                        obscureText: true,
                        validator: ((value) {
                          if (value!.isEmpty ||
                              !RegExp(r"^[a-zA-Z][a-zA-Z\s]{0,100}[a-zA-Z]$")
                                  .hasMatch(value)) {
                            return 'Enter valid password';
                          } else {
                            return null;
                          }
                        }),
                      ),
                      SizedBox(
                        height: height * 0.05,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Sign Up',
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF363f93)),
                          ),
                          FloatingActionButton(
                            onPressed: () {
                              if (formkey.currentState!.validate()) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackbar);
                              }
                            },
                            backgroundColor: const Color(0xFF363f93),
                            child: const Icon(Icons.forward),
                          )
                        ],
                      ),
                      SizedBox(
                        height: height * 0.1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text('Sign In',
                              style: TextStyle(color: Color(0xFF363f93))),
                          Text(
                            'Forgot Password',
                            style: TextStyle(color: Color(0xFF363f93)),
                          )
                        ],
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
