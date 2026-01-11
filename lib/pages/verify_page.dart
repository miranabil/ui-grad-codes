import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'home_page.dart';
import 'register_page.dart';

class VerifyPage extends StatelessWidget {
  const VerifyPage({super.key});

  static const Color primaryTeal = Color(0xFF1D5D6D);

  InputDecoration _otpInput() {
    return InputDecoration(
      counterText: '',
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(vertical: 12),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(22),
        borderSide: const BorderSide(color: Color(0xFFECECEC)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(22),
        borderSide: const BorderSide(color: primaryTeal, width: 1.2),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(22),
        borderSide: BorderSide.none,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.0, 0.68, 1.0],
            colors: [Color(0xFFFFFFFF), Color(0xFFEAF7FA), Color(0xFF66BFD3)],
          ),
        ),
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 28),
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: IntrinsicHeight(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: h * 0.12),

                        const Text(
                          'Verify Code',
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 12),

                        const Text(
                          'please enter the code we just sent\nto your phone number',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black54,
                            height: 1.35,
                          ),
                        ),

                        SizedBox(height: h * 0.06),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate(4, (index) {
                            return SizedBox(
                              width: 60,
                              height: 48,
                              child: TextField(
                                maxLength: 1,
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                decoration: _otpInput(),
                              ),
                            );
                          }),
                        ),

                        SizedBox(height: h * 0.03),

                        // ✅ نفس الجملة مثل الصورة + ترجع للرجستر
                        RichText(
                          text: TextSpan(
                            text: 'Edit Phone number',
                            style: const TextStyle(
                              fontSize: 13,
                              color: primaryTeal,
                              fontWeight: FontWeight.w600,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => const RegisterPage(),
                                  ),
                                );
                              },
                          ),
                        ),

                        SizedBox(height: h * 0.035),

                        RichText(
                          text: TextSpan(
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.black54,
                            ),
                            children: [
                              const TextSpan(text: "Didn’t receive OTP? "),
                              TextSpan(
                                text: "Resend code",
                                style: const TextStyle(
                                  color: primaryTeal,
                                  fontWeight: FontWeight.w600,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {},
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: h * 0.055),

                        SizedBox(
                          width: double.infinity,
                          height: 46,
                          child: ElevatedButton(
                            onPressed: () {
                              // ✅ يودّي على الهوم
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const HomePage(),
                                ),
                                (route) => false,
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: primaryTeal,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(26),
                              ),
                            ),
                            child: const Text(
                              'verify',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),

                        const Spacer(), // ✅ صار آمن الآن بسبب IntrinsicHeight
                        SizedBox(height: h * 0.02),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
