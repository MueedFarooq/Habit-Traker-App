import 'package:flutter/material.dart';

import 'Login_screen.dart';

class RagisterScreen extends StatefulWidget {
  const RagisterScreen({super.key});

  @override
  State<RagisterScreen> createState() => _RagisterScreenState();
}

class _RagisterScreenState extends State<RagisterScreen> {
  final _nameController = TextEditingController();
  final _usernameController = TextEditingController();
  double _age = 25;
  String _country = 'United States';
  List<String> _countries = [];
  List<String> selectedHabits = [];
  List<String> availableHabits = [
    'Wake Up Early',
    'Workout',
    'Drink Water',
    'Meditate',
    'Read a Book',
    'Practice Gratitude',
    'Sleep 8 Hours',
    'Eat Healthy',
    'Journal',
    'Walk 10,000 Steps'
  ];
  @override
  void initState() {
    super.initState();
    _fetchCountries();
  }
  Future<void> _fetchCountries() async {
    List<String> subsetCountries = [
      'United States',
      'Canada',
      'United Kingdom',
      'Australia',
      'India',
      'Germany',
      'France',
      'Japan',
      'China',
      'Brazil',
      'South Africa'
    ];
    setState(() {
      _countries = subsetCountries;
      _countries.sort();
      _country = _countries.isNotEmpty ? _countries[0] : 'United States';
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade700,
        title:const Text(
          'Register',
          style: TextStyle(
            fontSize: 25,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => LoginScreen()),
            );
          },
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.blue.shade700, Colors.blue.shade900],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildInputField(_nameController, 'Name', Icons.person),
                const SizedBox(height: 10),
                _buildInputField(_usernameController, 'Username', Icons.alternate_email),
                const SizedBox(height: 10),
                Text('Age: ${_age.round()}',
                    style: const TextStyle(color: Colors.white, fontSize: 18)),
                Slider(
                    value: _age,
                    min: 21,
                    max: 100,
                    divisions: 79,
                    activeColor: Colors.blue.shade600,
                    inactiveColor: Colors.blue.shade300,
                    onChanged: (value){
                  setState(() {
                    _age = value;
                  });
                }
                ),
                const SizedBox(height: 10),
                _buildCountryDropdown(),
                const SizedBox(height: 10),
                const Text('Select Your Habits',style: TextStyle(color: Colors.white, fontSize: 18)),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: availableHabits.map((habit){
                    final isSelected = selectedHabits.contains(habit);
                    return GestureDetector(
                      onTap: null,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                          color:
                          isSelected ? Colors.blue.shade600 : Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.blue.shade700),
                        ),
                        child: Text(
                          habit,
                          style: TextStyle(
                            color: isSelected
                                ? Colors.white
                                : Colors.blue.shade700,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                      onPressed: (){},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue.shade600,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        padding: EdgeInsets.symmetric(
                            horizontal: 80, vertical: 12
                        )
                      ),
                      child: Text('Register',style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),)
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget _buildInputField(TextEditingController controller,String hint,IconData icon){
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Colors.blue.shade700),
          hintText: hint,
          border: InputBorder.none,
          contentPadding:
          const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        ),
      ),
    );
  }
  Widget _buildCountryDropdown(){
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: DropdownButton(
          value: _country,
          icon: Icon(Icons.arrow_drop_down, color: Colors.blue.shade700),
          isExpanded: true,
          underline: const SizedBox(),
          items: _countries.map((String value){
        return DropdownMenuItem(
            value: value,
            child: Text(value)
        );
      }).toList(),
          onChanged: (newValue){
        setState(() {
          _country = newValue!;
        });
      }),
    );
  }
}
