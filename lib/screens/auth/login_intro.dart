import 'package:flutter/material.dart';

class LoginIntroPage extends StatefulWidget {
  const LoginIntroPage({super.key});
  @override
  State<LoginIntroPage> createState() => _LoginIntroPageState();
}

class _LoginIntroPageState extends State<LoginIntroPage> {

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        body: SafeArea(
          top: true,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 34, vertical: 150),
            child: Column(
              children: <Widget>[
                Align(
                  alignment: const Alignment(0, 0),
                  child: ClipRRect(
                    child: Image.asset(
                      'assets/login_intro_img.png',
                      width: 307,
                      height: 213,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 73),
                  child: Text(
                    'Welcome to PharmiGo!',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () => {
                    print("Do something")
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 0.0,
                    fixedSize: const Size(500, 43),
                    backgroundColor: Colors.teal.shade300,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    )
                  ),
                  child: const Text(
                    'Continue with Email',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  )
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 9),
                  child: ElevatedButton.icon(
                    onPressed: (){},
                    style: ElevatedButton.styleFrom(
                    elevation: 0.0,
                    fixedSize: const Size(500, 43),
                    backgroundColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                      side: const BorderSide(
                        color: Color.fromARGB(255, 182, 182, 182),
                        width: 1,
                      )
                    )
                  ),
                  icon: Image.asset(
                    "assets/google.png",
                    width: 20,
                    height: 20,
                  ),
                  label: const Text(
                    'Continue with Google',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
                )
              ],
            ),
          ),
          ),
        ),
    );
  }
}