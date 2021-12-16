import 'package:chat_app/allConstants/app_constants.dart';
import 'package:chat_app/allProviders/auth_provider.dart';
import 'package:chat_app/allProviders/setting_provider.dart';
import 'package:chat_app/allProviders/theme_provider.dart';
import 'package:chat_app/allScreens/splash_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences.getInstance().then((prefs) {
    String isDarkMode = prefs.getString("themeMode") ?? 'light';
    return runApp(MyApp(
      prefs: prefs,
      isDarkMode: isDarkMode,
    ));
  });
}

class MyApp extends StatelessWidget {
  final SharedPreferences prefs;
  final String isDarkMode;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseStorage firebaseStorage = FirebaseStorage.instance;

  MyApp({required this.prefs, required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(
          create: (_) => AuthProvider(
              firebaseAuth: FirebaseAuth.instance,
              googleSignIn: GoogleSignIn(),
              prefs: prefs,
              firebaseFirestore: firebaseFirestore),
        ),
        ChangeNotifierProvider<SettingProvider>(
          create: (_) => SettingProvider(
              prefs: this.prefs,
              firebaseFirestore: this.firebaseFirestore,
              firebaseStorage: this.firebaseStorage),
        ),
      ],
      child: ChangeNotifierProvider<ThemeProvider>(
        child: Consumer<ThemeProvider>(
          builder: (context, theme, _) => MaterialApp(
            title: AppConstants.appTitle,
            theme: theme.getTheme(),
            darkTheme: theme.getTheme(),
            home: SplashPage(),
            debugShowCheckedModeBanner: false,
          ),
        ),
        create: (_) => ThemeProvider(isDarkMode),
      ),
    );
  }
}
