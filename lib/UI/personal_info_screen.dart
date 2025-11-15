import 'package:flutter/material.dart';
import 'package:habit_traker/UI/Habit_Traker_Screen.dart';
import 'package:habit_traker/Utils/country_list.dart';
import 'package:habit_traker/Utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PersonalInfoScreen extends StatefulWidget {
  const PersonalInfoScreen({super.key});

  @override
  State<PersonalInfoScreen> createState() => _PersonalInfoScreenState();
}

class _PersonalInfoScreenState extends State<PersonalInfoScreen> {
  List<String> _countries = [];
  final _nameController = TextEditingController();
  final _usernameController = TextEditingController();
  double _age = 25;
  String _country = 'United States';
  Future<void> _loadCountries() async {
    try {
      final countries = await fetchCountries();
      setState(() {
        _countries = countries;
      });
    } catch (e) {
      Utils().toastMassage('error on fetching data');
    }
  }

  Future<void> _loadUserdata() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _nameController.text = prefs.getString('name') ?? '';
      _usernameController.text = prefs.getString('username') ?? '';
      _age = prefs.getDouble('age') ?? 25;
      _country = prefs.getString('country') ?? 'United States';
    });
  }

  Future<void> _saveUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', _nameController.text);
    await prefs.setString('username', _usernameController.text);
    await prefs.setDouble('age', _age);
    await prefs.setString('country', _country);
    Utils().toastMassage('Profile updated successfull');
    Navigator.pop(context,_usernameController.text);
    // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HabitTrakerScreen(username: _usernameController.text)));
  }
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadCountries();
    _loadUserdata();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade700,
        title: const Text(
          'Personal Info',
          style: const TextStyle(
            fontSize: 24,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        automaticallyImplyLeading: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(children: [
          const SizedBox(height: 42),
          _buildTextField(controller: _nameController, label: 'Name', icon: Icons.person),
          const SizedBox(height: 16),
          _buildTextField(controller: _usernameController, label: 'Username', icon: Icons.alternate_email),
          const SizedBox(height: 16),
          Text(
            'Age: ${_age.round()}',
            style: TextStyle(color: Colors.blue.shade700, fontSize: 18),
          ),
          Slider(
              min: 25,
              max: 100,
              activeColor: Colors.blue.shade600,
              inactiveColor: Colors.blue.shade300,
              value: _age, onChanged: (value){
            setState(() {
              _age =value;
            });
          }),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.blue.shade700),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: DropdownButton<String>(
              value: _country,
              isExpanded: true,
              underline: const SizedBox(),
              items: _countries.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  _country = newValue!;
                });
              },
            ),
          ),
          const SizedBox(height: 24),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue.shade700,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                padding:
                const EdgeInsets.symmetric(horizontal: 60, vertical: 12),
                elevation: 5,
              ),
              onPressed: _saveUserData, child: Text(
              'Save Changes',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),)
        ]),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
  }) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.blue.shade700),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Colors.blue.shade700),
          labelText: label,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
