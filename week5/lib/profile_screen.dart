import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileScreen extends StatelessWidget {
  Future<DocumentSnapshot> getUserData() async {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    return FirebaseFirestore.instance.collection("users").doc(uid).get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("User Profile")),
      body: FutureBuilder<DocumentSnapshot>(
        future: getUserData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) return Center(child: CircularProgressIndicator());
          if (!snapshot.hasData || snapshot.data == null) return Center(child: Text("No data"));

          final data = snapshot.data!.data() as Map<String, dynamic>;
          return Column(
            children: [
              SizedBox(height: 20),
              CircleAvatar(radius: 40, child: Text(data['name'][0])),
              SizedBox(height: 20),
              Text("Name: ${data['name']}", style: TextStyle(fontSize: 20)),
              Text("Email: ${data['email']}", style: TextStyle(fontSize: 16)),
            ],
          );
        },
      ),
    );
  }
}
