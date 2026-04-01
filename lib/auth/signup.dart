import 'package:bonless61/core/theme/app_colors.dart';
import 'package:bonless61/wigets/widgetexport.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool isPasswordHidden = true;
  bool agree = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final screenWidth = constraints.maxWidth;
            final screenHeight = constraints.maxHeight;
            final compact = screenHeight < 760;

            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.045,
                vertical: compact ? 10 : 16,
              ),
              child: Column(
                children: [
                  Expanded(
                    flex: compact ? 2 : 2,
                    child: Center(
                      child: Transform.scale(
                        scale: compact ? 0.82 : 0.94,
                        child: const AuthHeader(
                          title: "JOIN BONLESS 61",
                          subtitle:
                              "CREATE YOUR ACCOUNT TO ORDER\nFASTER AND EARN REWARDS",
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: compact ? 10 : 18),
                  Expanded(
                    flex: compact ? 6 : 5,
                    child: _buildForm(
                      screenWidth,
                      screenHeight,
                      compact: compact,
                    ),
                  ),
                  
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildForm(
    double screenWidth,
    double screenHeight, {
    required bool compact,
  }) {
    final fieldHeight = compact ? 40.0 : 52.0;
    final labelFontSize = compact ? 9.0 : 11.0;
    final labelSpacing = compact ? 4.0 : 8.0;
    final fieldRadius = compact ? 20.0 : 28.0;
    final cardRadius = compact ? 10.0 : 14.0;
    final fieldGap = compact ? 6.0 : 12.0;
    final buttonGap = compact ? 10.0 : 18.0;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: compact ? 14 : 18,
        vertical: compact ? 12 : 18,
      ),
      decoration: BoxDecoration(
        color: AppColors.darkGrey,
        borderRadius: BorderRadius.circular(cardRadius),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.35),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildInputField(
            label: 'FULL NAME',
            hint: 'FULL NAME',
            prefixIcon: Icons.person,
            inputHeight: fieldHeight,
            labelFontSize: labelFontSize,
            labelSpacing: labelSpacing,
            borderRadius: fieldRadius,
          ),
          SizedBox(height: fieldGap),
          buildInputField(
            label: 'BIRTH DATE',
            hint: 'DD/MM/YYYY',
            prefixIcon: Icons.calendar_today,
            inputHeight: fieldHeight,
            labelFontSize: labelFontSize,
            labelSpacing: labelSpacing,
            borderRadius: fieldRadius,
          ),
          SizedBox(height: fieldGap),
          buildInputField(
            label: 'PHONE NUMBER',
            hint: 'PHONE NUMBER',
            keyboardType: TextInputType.phone,
            prefixIcon: Icons.phone,
            inputHeight: fieldHeight,
            labelFontSize: labelFontSize,
            labelSpacing: labelSpacing,
            borderRadius: fieldRadius,
          ),
          SizedBox(height: fieldGap),
          buildInputField(
            label: 'EMAIL ADDRESS',
            hint: 'EMAIL ADDRESS',
            keyboardType: TextInputType.emailAddress,
            prefixIcon: Icons.email,
            inputHeight: fieldHeight,
            labelFontSize: labelFontSize,
            labelSpacing: labelSpacing,
            borderRadius: fieldRadius,
          ),
          SizedBox(height: fieldGap),
          buildInputField(
            label: 'PASSWORD',
            hint: '••••••••',
            prefixIcon: Icons.lock,
            isPassword: true,
            obscureText: isPasswordHidden,
            onToggle: () {
              setState(() {
                isPasswordHidden = !isPasswordHidden;
              });
            },
            inputHeight: fieldHeight,
            labelFontSize: labelFontSize,
            labelSpacing: labelSpacing,
            borderRadius: fieldRadius,
          ),
          SizedBox(height: buttonGap),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Transform.scale(
                scale: compact ? 0.82 : 0.95,
                child: Checkbox(
                  value: agree,
                  onChanged: (v) {
                    setState(() {
                      agree = v ?? false;
                    });
                  },
                  activeColor: AppColors.primaryRed,
                  side: const BorderSide(color: Colors.white24),
                ),
              ),
              SizedBox(width: compact ? 4 : 8),
              Expanded(
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: compact ? 10 : 13,
                    ),
                    children: const [
                      TextSpan(text: 'I agree to the '),
                      TextSpan(
                        text: 'Terms & Conditions',
                        style: TextStyle(color: AppColors.primaryRed),
                      ),
                      TextSpan(text: ' and '),
                      TextSpan(
                        text: 'Privacy Policy',
                        style: TextStyle(color: AppColors.primaryRed),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: compact ? 6 : 12),
          buildButton(
            text: 'CREATE ACCOUNT',
            height: compact ? 42 : 52,
            fontSize: compact ? 13 : 15,
            borderRadius: compact ? 22 : 28,
          ),
          SizedBox(height: compact ? 6 : 12),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: compact ? 11 : 13,
                ),
                children: const [
                  TextSpan(text: 'Already have an account? '),
                  TextSpan(
                    text: 'SIGN IN',
                    style: TextStyle(
                      color: AppColors.primaryRed,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}