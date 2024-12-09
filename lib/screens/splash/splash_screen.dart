import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Navigate to the intro screen after 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/intro');
    });

    return Scaffold(
      body: Center(
        child: Container(
          width: 375,
          height: 812,
          padding: const EdgeInsets.only(left: 108, right: 109),
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(color: Colors.white),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Logo Container
              Container(
                width: 96,
                height: 96,
                padding: const EdgeInsets.only(bottom: 0.39),
                child: Image.asset(
                  'assets/logo.png', // Path to your logo
                  width: 96,
                  height: 96,
                  fit: BoxFit.cover, // Adjust as needed
                ),
              ),
              const SizedBox(height: 15),
              // Text below the logo
              const Text(
                'PharmiGo',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF37B9C5),
                  fontSize: 28,
                  fontFamily: 'Manrope',
                  fontWeight: FontWeight.w700,
                  height: 1.2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
