import 'package:flutter/material.dart';
import 'package:habit_traker/UI/Habit_Traker_Screen.dart';
import 'package:habit_traker/UI/Ragister_screen.dart';
import 'package:habit_traker/Utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  final String defaultUsername = 'testuser';
  final String defaultPassword = 'password123';

  void _login() async{
    // The login logic goes here
    print("login func called");
    final username = _usernameController.text;
    final password = _passwordController.text;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (username == defaultUsername && password == defaultPassword) {
      await prefs.setString('name', 'Test User');
      await prefs.setString('username', 'testuser');
      await prefs.setDouble('age', 25);
      await prefs.setString('country', 'United States');
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HabitTrakerScreen(username: username),
        ),
      );
    }
    else{
      await prefs.clear();
      Utils().toastMassage('User name or Password was incorrect');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.blue.shade700, Colors.blue.shade900
          ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Habitt',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 30),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: TextField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      prefixIcon:
                      Icon(Icons.email, color: Colors.blue.shade700),
                      hintText: 'Enter Username',
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  decoration:BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock, color: Colors.blue.shade700),
                      hintText: 'Enter Password',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 20,vertical: 15
                      )
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: (){
                    // ----
                  }, child: Text(
                  'Forgot password?',
                  style: TextStyle(color: Colors.white),
                ),),
              ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _login,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade600,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 80, vertical: 12),
                  ),
                  child: const Text(
                    'Log in',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'or',
                  style: TextStyle(color: Colors.white70),
                ),
                const SizedBox(height: 10),
                OutlinedButton(
                  onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>RagisterScreen()));
                }, child: const Text(
                  'Sign up',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Colors.white),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 70, vertical: 12),
                ),
                )
              ],
            ),
          ),
        ),
      )
    );
  }
}
