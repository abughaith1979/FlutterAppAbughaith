import 'dart:async';
import 'package:flutter/material.dart';
import 'package:police/main_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool colorChooce = true;
  bool showPassword = false;

  TextEditingController emailController = TextEditingController(text: "abed");
  TextEditingController passwordController = TextEditingController(text: "123");

  @override
  void initState() {
    const oneSec = Duration(seconds: 1);
    Timer.periodic(oneSec, (Timer t) {
      colorChooce = !colorChooce;
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              logo(),
              const SizedBox(height: 8),
              const Text(
                "Police App",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16, left: 25, right: 25),
                child: Row(
                  children: [
                    alLawaa7(
                      color: colorChooce ? Colors.red : Colors.blue,
                      borderRadios:
                          const BorderRadius.only(topLeft: Radius.circular(25), bottomLeft: Radius.circular(25)),
                    ),
                    alLawaa7(
                      color: colorChooce ? Colors.blue : Colors.red,
                      borderRadios:
                          const BorderRadius.only(topRight: Radius.circular(25), bottomRight: Radius.circular(25)),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: "Email",
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () {
                        emailController.text = "";
                      },
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: TextField(
                  controller: passwordController,
                  obscureText: showPassword,
                  decoration: InputDecoration(
                    labelText: "password",
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    suffixIcon: SizedBox(
                      width: 100,
                      child: Row(
                        children: [
                          IconButton(
                            icon: Icon(showPassword ? Icons.remove_red_eye : Icons.visibility_off),
                            onPressed: () {
                              showPassword = !showPassword;
                              setState(() {});
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.close),
                            onPressed: () {
                              passwordController.text = "";
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () {
                    if (emailController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("please enter your email"),
                      ));
                    } else if (passwordController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("please enter your password"),
                      ));
                    } else {
                      if (emailController.text != "abed" || passwordController.text != "123") {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Email or password not valid"),
                        ));
                      } else {
                        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (ctx) {
                          return const MainScreen();
                        }), (route) => false);
                        // Navigator.of(context)
                        //     .push(MaterialPageRoute(builder: (ctx) {
                        //   return const MainScreen();
                        // }));
                      }
                    }
                  },
                  child: const Text("Login"))
            ],
          ),
        ),
      ),
    );
  }

  Widget alLawaa7({required Color color, required BorderRadiusGeometry borderRadios}) {
    return Expanded(
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: color,
          borderRadius: borderRadios,
        ),
      ),
    );
  }

  Widget logo() {
    return Center(
      child: Image.asset(
        "swaar/logo.jpg",
        width: 250,
      ),
    );
  }
}
