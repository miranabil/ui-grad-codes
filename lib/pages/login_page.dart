import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'home_page.dart';
import 'register_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static const Color primaryTeal = Color(0xFF1D5D6D);

  InputDecoration _pillInput({
    required String hint,
    Widget? prefixIcon,
    Widget? suffix,
  }) {
    return InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(color: Color(0xFFB8B8B8), fontSize: 13),
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
      prefixIcon: prefixIcon,
      suffixIcon: suffix,
      prefixIconConstraints: const BoxConstraints(minWidth: 44, minHeight: 44),
      suffixIconConstraints: const BoxConstraints(minWidth: 44, minHeight: 44),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(color: Color(0xFFECECEC)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(color: primaryTeal, width: 1.2),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide.none,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;

    final topGap = h * 0.30;
    final fieldsGap = h * 0.05;
    final afterFieldsGap = h * 0.04;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.08, 0.34, 0.73, 1.0],
            colors: [
              Color(0xFF9CCAD5), // 8%
              Color(0xFFF8F8F8), // 34%
              Color(0xFFF8F8F8), // 73%
              Color(0xFF9CCAD5), // 100%
            ],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 26),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: topGap),

                const Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 10),

                RichText(
                  text: TextSpan(
                    style: const TextStyle(fontSize: 13, color: Colors.black54),
                    children: [
                      const TextSpan(text: "Don’t have an account? "),
                      TextSpan(
                        text: "register",
                        style: const TextStyle(
                          color: primaryTeal,
                          fontWeight: FontWeight.w600,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const RegisterPage(),
                              ),
                            );
                          },
                      ),
                    ],
                  ),
                ),

                SizedBox(height: fieldsGap),

                TextField(decoration: _pillInput(hint: 'Phone number')),
                const SizedBox(height: 14),

                TextField(
                  obscureText: true,
                  decoration: _pillInput(
                    hint: 'Password',
                    prefixIcon: const Icon(
                      Icons.lock_outline,
                      color: Color(0xFFB8B8B8),
                      size: 20,
                    ),
                    suffix: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 14),
                        foregroundColor: primaryTeal,
                      ),
                      child: const Text(
                        'FORGOT',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.2,
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: afterFieldsGap),

                Align(
                  alignment: Alignment.centerRight,
                  child: SizedBox(
                    height: 44,
                    width: 120,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (_) => const HomePage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryTeal,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: h * 0.10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
