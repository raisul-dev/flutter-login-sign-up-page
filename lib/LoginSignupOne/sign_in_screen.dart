import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Dark background behind the card
      body: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: MediaQuery.of(context).size.height * 0.9,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
          ),
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 12),
                // Grey handle bar
                Container(width: 50, height: 5, decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(10))),
                SizedBox(height: 30),

                Text("Welcome Back!", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                Text("Let's login for explore continues", style: TextStyle(color: Colors.grey)),
                SizedBox(height: 30),

                // Placeholder for Logo
                Icon(Icons.flash_on, size: 80, color: Colors.red),
                Text("REXODUS GAMING", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900, letterSpacing: 1.2)),
                SizedBox(height: 40),

                // Email Field
                _buildLabel("Email or Phone Number"),
                _buildTextField(hint: "Enter your email", icon: Icons.email_outlined),

                SizedBox(height: 20),

                // Password Field
                _buildLabel("Password"),
                _buildTextField(
                  hint: "Enter your password",
                  icon: Icons.lock_outline,
                  isPassword: true,
                  suffix: IconButton(
                    icon: Icon(_obscureText ? Icons.visibility_off_outlined : Icons.visibility_outlined),
                    onPressed: () => setState(() => _obscureText = !_obscureText),
                  ),
                ),

                // Checkbox and Forgot Password
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(value: false, onChanged: (v) {}, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))),
                        Text("Keep me signed in", style: TextStyle(color: Colors.grey[600], fontSize: 12)),
                      ],
                    ),
                    TextButton(onPressed: () {}, child: Text("Forgot password", style: TextStyle(color: Colors.red, fontSize: 12))),
                  ],
                ),

                SizedBox(height: 20),

                // Sign In Button
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red[700],
                    minimumSize: Size(double.infinity, 55),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  ),
                  onPressed: () {},
                  child: Text("Sign in", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                ),

                SizedBox(height: 30),
                _buildSocialDivider(),
                SizedBox(height: 20),

                // Social Icons (Placeholder Icons)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _socialIcon(Icons.facebook, Colors.blue),
                    SizedBox(width: 20),
                    _socialIcon(Icons.g_mobiledata, Colors.orange),
                    SizedBox(width: 20),
                    _socialIcon(Icons.apple, Colors.black),
                  ],
                ),

                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account? ", style: TextStyle(color: Colors.black)),
                    Text("Sign Up here", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
                  ],
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // --- Helper Widgets ---

  Widget _buildLabel(String text) => Align(
      alignment: Alignment.centerLeft,
      child: Padding(padding: EdgeInsets.only(bottom: 8), child: Text(text, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)))
  );

  Widget _buildTextField({required String hint, required IconData icon, bool isPassword = false, Widget? suffix}) {
    return TextField(
      obscureText: isPassword && _obscureText,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey[400], fontSize: 14),
        prefixIcon: Icon(icon, color: Colors.red[400], size: 20),
        suffixIcon: suffix,
        filled: true,
        fillColor: Colors.grey[100],
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
      ),
    );
  }

  Widget _buildSocialDivider() {
    return Row(
      children: [
        Expanded(child: Divider(color: Colors.grey[300])),
        Padding(padding: EdgeInsets.symmetric(horizontal: 10), child: Text("You can Connect with", style: TextStyle(color: Colors.grey, fontSize: 12))),
        Expanded(child: Divider(color: Colors.grey[300])),
      ],
    );
  }

  Widget _socialIcon(IconData icon, Color color) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: Colors.grey[200]!)),
      child: Icon(icon, color: color, size: 30),
    );
  }
}