import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_signin/auth/auth.dart';
import 'package:google_signin/routes.dart';
import 'package:google_signin/screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Google SignIn',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        primarySwatch: Colors.blue,
        // useMaterial3: true,
      ),
      initialRoute: AppRoutes.authScreen,
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case AppRoutes.authScreen:
            return MaterialPageRoute(builder: (context) => const AuthPage());
          case AppRoutes.homeScreen:
            return MaterialPageRoute(
                builder: (context) => HomeScreen(title: 'Home'));
          default:
            return MaterialPageRoute(
              builder: (context) => const AuthPage(),
            );
        }
      },
    );
  }
}
