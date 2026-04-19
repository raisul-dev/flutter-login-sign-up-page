import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _obscurePassword = true;
  bool _obscureConfirm = true;
  bool _isVisible = false;

  @override
  void initState() {
    super.initState();
    // Trigger entry animations
    Future.delayed(Duration(milliseconds: 100), () {
      if (mounted) setState(() => _isVisible = true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Align(
        alignment: Alignment.bottomCenter,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 600),
          curve: Curves.easeOutCubic,
          height: _isVisible ? MediaQuery.of(context).size.height * 0.9 : 0,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
          ),
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                SizedBox(height: 12),
                // Handle Bar
                Container(
                  width: 50,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                SizedBox(height: 30),

                _anim(delay: 200, child: _buildHeader()),
                _anim(delay: 400, child: _buildLogo()),

                SizedBox(height: 30),

                _anim(delay: 600, child: _buildForm()),

                SizedBox(height: 40),

                _anim(
                  delay: 800,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red[700],
                      minimumSize: Size(double.infinity, 55),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 0,
                    ),
                    onPressed: () {},
                    child: Text(
                      "Continue",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // --- Sub-Widgets ---

  Widget _buildHeader() {
    return Column(
      children: [
        Text(
          "Create Your Account",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 4),
        Text(
          "Create account for exploring news",
          style: TextStyle(color: Colors.grey[500], fontSize: 14),
        ),
      ],
    );
  }

  Widget _buildLogo() {
    return Column(
      children: [
        SizedBox(height: 20),
        // Custom 'R' Logo logic
        Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(Icons.bolt, color: Colors.white, size: 40),
        ),
        SizedBox(height: 10),
        Text(
          "REXODUS GAMING",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w900,
            letterSpacing: 1.0,
          ),
        ),
      ],
    );
  }

  Widget _buildForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _label("First Name"),
        _input("First Name", Icons.badge_outlined),
        SizedBox(height: 20),

        _label("Last Name"),
        _input("Last Name", Icons.badge_outlined),
        SizedBox(height: 20),

        _label("Password"),
        _input(
          "Enter your password",
          Icons.lock_outline,
          isPass: true,
          obs: _obscurePassword,
          onToggle: () => setState(() => _obscurePassword = !_obscurePassword),
        ),
        SizedBox(height: 20),

        _label("Confirm Password"),
        _input(
          "Confirm Password",
          Icons.lock_outline,
          isPass: true,
          obs: _obscureConfirm,
          onToggle: () => setState(() => _obscureConfirm = !_obscureConfirm),
        ),
      ],
    );
  }

  // --- Helpers ---

  Widget _anim({required int delay, required Widget child}) {
    return AnimatedOpacity(
      duration: Duration(milliseconds: 500),
      opacity: _isVisible ? 1.0 : 0.0,
      child: AnimatedPadding(
        duration: Duration(milliseconds: 500),
        curve: Curves.easeOutQuad,
        padding: EdgeInsets.only(top: _isVisible ? 0 : 20),
        child: child,
      ),
    );
  }

  Widget _label(String text) => Padding(
    padding: EdgeInsets.only(bottom: 8),
    child: Text(
      text,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
    ),
  );

  Widget _input(
    String hint,
    IconData icon, {
    bool isPass = false,
    bool obs = false,
    VoidCallback? onToggle,
  }) {
    return TextField(
      obscureText: isPass ? obs : false,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey[400], fontSize: 14),
        prefixIcon: Icon(icon, color: Colors.red[300], size: 22),
        suffixIcon: isPass
            ? IconButton(
                icon: Icon(
                  obs
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  color: Colors.grey,
                ),
                onPressed: onToggle,
              )
            : null,
        filled: true,
        fillColor: Colors.grey[50]?.withOpacity(0.8),
        contentPadding: EdgeInsets.symmetric(vertical: 18),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.grey[200]!),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.grey[200]!),
        ),
      ),
    );
  }
}
