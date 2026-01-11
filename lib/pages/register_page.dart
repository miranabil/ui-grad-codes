import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'login_page.dart';
import 'verify_page.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  static const Color primaryTeal = Color(0xFF1D5D6D);
  static const Color createButtonColor = Color(0xFF3C7381); // ✅ اللون الجديد

  InputDecoration _pillInput(String hint) {
    return InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(color: Color(0xFFB8B8B8), fontSize: 13),
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
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
    final size = MediaQuery.of(context).size;
    final h = size.height;

    final topGap = h * 0.14;
    final fieldsTopGap = h * 0.055;
    final bottomSpace = h * 0.05; // ✅ أقل = رفع الجملة لفوق

    // بداية التدرج مثل الصورة
    final gradientStart = h * 0.55;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // خلفية بيضاء
          const Positioned.fill(child: ColoredBox(color: Colors.white)),

          // التدرج من الأسفل فقط
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: gradientStart,
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0x00FFFFFF), Color(0xFF66BFD3)],
                ),
              ),
            ),
          ),

          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight:
                      MediaQuery.of(context).size.height -
                      MediaQuery.of(context).padding.top,
                ),
                child: Column(
                  children: [
                    SizedBox(height: topGap),

                    const Text(
                      'Create Account',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 10),

                    const Text(
                      'fill your information below or register\nwith your social account',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black54,
                        height: 1.35,
                      ),
                    ),

                    SizedBox(height: fieldsTopGap),

                    TextField(decoration: _pillInput('Full name')),
                    const SizedBox(height: 16),
                    TextField(decoration: _pillInput('Phone number')),
                    const SizedBox(height: 16),
                    TextField(
                      obscureText: true,
                      decoration: _pillInput('Create password'),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      obscureText: true,
                      decoration: _pillInput('Confirm password'),
                    ),

                    const SizedBox(height: 28),

                    // زر create
                    Align(
                      alignment: Alignment.centerRight,
                      child: SizedBox(
                        height: 44,
                        width: 130,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const VerifyPage(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                createButtonColor, // ✅ اللون الجديد
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(26),
                            ),
                          ),
                          child: const Text(
                            'create', // ✅ النص الجديد
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: bottomSpace),

                    // الجملة مرفوعة لبداية الأبيض
                    RichText(
                      text: TextSpan(
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.black54,
                        ),
                        children: [
                          const TextSpan(text: 'Already have an account? '),
                          TextSpan(
                            text: 'log in',
                            style: const TextStyle(
                              color: primaryTeal,
                              fontWeight: FontWeight.w600,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => const LoginPage(),
                                  ),
                                  (route) => false,
                                );
                              },
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: h * 0.08),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
