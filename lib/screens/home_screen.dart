import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_signin/services/auth_service.dart';

// ignore: must_be_immutable
class HomeScreen extends StatefulWidget {
  String title;

  HomeScreen({super.key, required this.title});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            '${widget.title} ${FirebaseAuth.instance.currentUser?.displayName ?? 'No data'}'),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {
                AuthService().handleSignOut();
                Navigator.pushReplacementNamed(context, '/auth');
              },
              icon: const Icon(Icons.logout)),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(
              FirebaseAuth.instance.currentUser?.photoURL ??
                  'https://icon-library.com/images/username-icon-png/username-icon-png-5.jpg',
            ),
            Text(
              FirebaseAuth.instance.currentUser?.displayName ?? 'No Data',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              FirebaseAuth.instance.currentUser?.email ?? 'No Data',
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 14,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
