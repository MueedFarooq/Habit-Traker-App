import 'dart:convert' as convert;
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  Future<Map<String, dynamic>> loadUserData(String defaultUsername) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String name = prefs.getString('name') ?? defaultUsername;

    Map<String, String> selectedHabits = Map<String, String>.from(
      convert.jsonDecode(prefs.getString('selectedHabitsMap') ?? '{}'),
    );

    Map<String, String> completedHabits = Map<String, String>.from(
      convert.jsonDecode(prefs.getString('completedHabitsMap') ?? '{}'),
    );

    return {
      'name': name,
      'selectedHabitsMap': selectedHabits,
      'completedHabitsMap': completedHabits,
    };
  }

  Future<void> saveHabits(
      Map<String, String> selectedHabits,
      Map<String, String> completedHabits) async {

    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString(
      'selectedHabitsMap',
      convert.jsonEncode(selectedHabits),
    );

    await prefs.setString(
      'completedHabitsMap',
      convert.jsonEncode(completedHabits),
    );
  }
}