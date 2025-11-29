# Habit Tracker App

<div align="center">

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)

**A beautiful and intuitive habit tracking application built with Flutter**

Track your daily habits • Build consistency • Achieve your goals

[Features](#-features) • [Screenshots](#-screenshots) • [Installation](#-installation) • [Usage](#-usage)

</div>

---

## 📖 About

**Habit Tracker** is a simple yet powerful mobile application designed to help you build and maintain positive habits. With an intuitive swipe-to-complete interface, local data persistence, and insightful progress reports, staying on track with your goals has never been easier.

---

## Features

###  **User Authentication**
- Secure login and registration system
- Auto-login with saved credentials using SharedPreferences
- Profile management with personal information

###  **Habit Management**
- Create custom habits with personalized colors
- Organize habits in an easy-to-view To-Do list
- All data stored locally for privacy and offline access

###  **Swipe-to-Complete**
- Intuitive swipe gesture to mark habits as complete
- Completed habits automatically move to the DONE section
- Swipe again to revert habits back to To-Do

###  **Progress Tracking**
- Dedicated "Completed Habits" section with visual indicators
- Beautiful UI with colored cards and checkmark icons
- Track your consistency over time

###  **Smart Notifications**
- Built-in notification system
- Toggle notifications on/off from settings
- Local reminders to keep you accountable

###  **Personal Profile**
- Edit name, email, and country
- Country selection from comprehensive list
- All changes saved locally

###  **Detailed Reports**
- Weekly and monthly progress analytics
- Visual breakdown of completed habits
- Track your improvement over time

###  **Local Storage**
- All data stored securely on your device
- No internet connection required
- Fast and responsive performance

---

## Screenshots

<div align="center">

### Authentication
| Login Screen | Register Screen |
|:------------:|:---------------:|
| <img width="250" alt="simulator_screenshot_14B3B440-9922-49FD-BD75-2984BCFCD775" src="https://github.com/user-attachments/assets/4d97412d-6ec5-4f60-8b70-b868a6612178" /> | <img width="250" alt="simulator_screenshot_0191833C-63A5-4D22-81BC-3B8DDCEE0252" src="https://github.com/user-attachments/assets/8e301c53-053b-45af-b64b-74bb702e69ab" />
|

### Main Features
| Habit Tracker Home | Add Habit |
|:------------------:|:---------:|
| <img width="250" alt="simulator_screenshot_F55BE2B7-6545-4F39-8BC0-6858AE9FC2F2" src="https://github.com/user-attachments/assets/c1e8d3eb-24a4-476c-9306-bde9f2f6a848" /> | <img width="250" alt="simulator_screenshot_B37896F8-3D0F-4ACF-8B35-35F8469140B2" src="https://github.com/user-attachments/assets/28f9c232-5ee9-4ba8-ac5e-97f7ee75d708" /> |



### Progress & Settings
| Completed Habits | Reports |
|:----------------:|:-------:|
|<img width="250" alt="simulator_screenshot_82A9D05D-D7FE-4EFA-8925-637463D8BB82" src="https://github.com/user-attachments/assets/8e659332-88bb-49d3-8d9e-6507e91a6465" /> | <img width="250" alt="simulator_screenshot_05D482DE-7BD5-4034-8783-6946B4C5B4C0" src="https://github.com/user-attachments/assets/63e30c18-eaa0-4abf-98de-ade00eeadb67" /> |



| Notifications | Personal Info |
|:-------------:|:-------------:|
| <img width="250" alt="Screenshot 2025-11-30 at 12 57 41 am" src="https://github.com/user-attachments/assets/7bd9298c-7b89-4fce-9ef1-9f313bef4fb5" /> | <img width="250" alt="simulator_screenshot_FA16B7AD-52FF-441F-94C6-09531225C3D4" src="https://github.com/user-attachments/assets/47f324f5-a857-4f15-87aa-20e2b565907a" /> |

</div>


---

## Project Structure

```
lib/
├── UI/
│   ├── Habit_Traker_Screen.dart    # Main habit tracking interface
│   ├── Login_screen.dart            # User login page
│   ├── Notification_screen.dart     # Notification settings
│   ├── Ragister_screen.dart         # User registration page
│   ├── ReportScreen.dart            # Progress reports & analytics
│   ├── add_habit_screen.dart        # Add new habit interface
│   └── personal_info_screen.dart    # User profile management
│
├── Utils/
│   ├── country_list.dart            # List of countries for profile
│   └── utils.dart                   # Utility functions & helpers
│
├── services/
│   └── local_storage.dart           # SharedPreferences wrapper
│
└── main.dart                        # App entry point
```

---

##  Tech Stack

| Technology | Purpose |
|-----------|---------|
| **Flutter** | Cross-platform UI framework |
| **Dart** | Programming language |
| **SharedPreferences** | Local data persistence |
| **Material Design** | UI components & design system |
| **Flutter Local Notifications** | Push notification system |

---

##  Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  
  cupertino_icons: ^1.0.8                    # iOS-style icons
  shared_preferences: ^2.5.3                 # Local storage
  fluttertoast: ^9.0.0                       # Toast notifications
  http: ^1.5.0                               # HTTP requests
  flutter_local_notifications: ^19.5.0       # Local notifications
```

---

##  Installation

### Prerequisites
- Flutter SDK (>=3.0.0)
- Dart SDK (>=3.0.0)
- Android Studio / Xcode (for emulators)
- A code editor (VS Code, Android Studio, etc.)

### Steps

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/habit-tracker-app.git
   cd habit-tracker-app
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   # For Android
   flutter run
   
   # For iOS
   flutter run -d ios
   
   # For a specific device
   flutter devices
   flutter run -d <device_id>
   ```

4. **Build for production**
   ```bash
   # Android APK
   flutter build apk --release
   
   # iOS
   flutter build ios --release
   ```

---

##  Usage

### Getting Started

1. **Register an Account**
   - Open the app and tap "Register"
   - Enter your name, email, and password
   - Your information is saved locally

2. **Add Your First Habit**
   - Tap the "+" button on the home screen
   - Enter habit name and select a color
   - Tap "Save" to add the habit

3. **Mark Habits as Complete**
   - Swipe right on any habit to mark it as done
   - The habit moves to the "Completed" section
   - Swipe again to move it back if needed

4. **View Progress**
   - Navigate to the Reports section
   - See your weekly and monthly statistics
   - Track your consistency over time

5. **Manage Profile**
   - Go to Personal Info
   - Update your name, email, or country
   - Changes are saved automatically

---

## Local Storage Schema

The app uses **SharedPreferences** to store data locally:

| Key | Data Type | Description |
|-----|-----------|-------------|
| `name` | String | User's name |
| `email` | String | User's email |
| `country` | String | User's country |
| `selectedHabitsMap` | JSON String | Active habits list |
| `completedHabitsMap` | JSON String | Completed habits list |
| `isLoggedIn` | Boolean | Login status |

---

##  Future Enhancements

- [ ] Cloud sync with Firebase
- [ ] Habit streaks and milestone badges
- [ ] Advanced analytics with charts
- [ ] Social sharing features
- [ ] Customizable themes (dark mode)
- [ ] Habit categories and tags
- [ ] Reminders with custom times
- [ ] Export data to CSV/PDF

---

##  Contributing

Contributions are welcome! Please follow these steps:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

---

<div align="center">

**If you found this project helpful, please give it a ⭐️**

Made with ❤️ using Flutter

</div>
