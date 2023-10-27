// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'editcaregiver.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AddCaregiverPage extends StatefulWidget {
  @override
  _AddCaregiverPageState createState() => _AddCaregiverPageState();
}

class _AddCaregiverPageState extends State<AddCaregiverPage> {
  TextEditingController careFNameController = TextEditingController();
  TextEditingController careLNameController = TextEditingController();
  TextEditingController careAgeController = TextEditingController();
  TextEditingController careAddressController = TextEditingController();
  TextEditingController careContactNumController = TextEditingController();
  TextEditingController careEmailController = TextEditingController();
  TextEditingController careUserNameController = TextEditingController();
  TextEditingController carePasswordController = TextEditingController();
  TextEditingController careStatusController = TextEditingController();// Add this controller for caregiver info

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Caregiver Information'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
            controller: careFNameController,
            decoration: InputDecoration(labelText: 'First Name'),
          ),
          TextFormField(
            controller: careLNameController,
            decoration: InputDecoration(labelText: 'Last Name'),
          ),
          TextFormField(
            controller: careAgeController,
            decoration: InputDecoration(labelText: 'Age'),
          ),
          TextFormField(
            controller: careAddressController,
            decoration: InputDecoration(labelText: 'Address'),
          ),
          TextFormField(
            controller: careContactNumController,
            decoration: InputDecoration(labelText: 'Contact Number'),
          ),
          TextFormField(
            controller: careEmailController,
            decoration: InputDecoration(labelText: 'Email'),
          ),
          TextFormField(
            controller: careUserNameController,
            decoration: InputDecoration(labelText: 'Username'),
          ),
          TextFormField(
            controller: carePasswordController,
            decoration: InputDecoration(labelText: 'Password'),
          ),
          TextFormField(
            controller: careStatusController,
            decoration: InputDecoration(labelText: 'Status'),
          ), 
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                savePhoneNumber();
              },
              child: Text('Save Caregiver'),
            ),
          ],
        ),
      ),
    );
  }

  void savePhoneNumber() {
    final fname = careFNameController.text;
    final lname = careLNameController.text;
    final age = int.parse(careAgeController.text);
    final address = careAddressController.text;
    final contactnum = int.parse(careContactNumController.text);
    final email = careEmailController.text;
    final username = careUserNameController.text;
    final password = carePasswordController.text;
    final status = careStatusController.text; 
    final datecreated = DateTime.now();

    if (fname.isNotEmpty && lname.isNotEmpty && 
    age != 0 && address.isNotEmpty &&
    contactnum != 0 && email.isNotEmpty &&
    username.isNotEmpty && password.isNotEmpty &&
    status.isNotEmpty) {
      // Access your Firestore collection and save the name, phone number, and status.
      FirebaseFirestore.instance
          .collection('device')
          .doc('31y1sQrytWv6r8gmNSwg')
          .collection('admin')
          .doc('Ardvn3AF3sEqkz1nC5Uc')
          .collection('caregiver')
          .add({
        'careFName': fname,
        'careLName': lname,
        'careAge': age,
        'careAddress': address,
        'careContactNum': contactnum,
        'careEmail': email,
        'careUserName': username,
        'carePassword': password,
        'careStatus': status, 
        'careDateCreated' : datecreated// Save caregiver
      });
      //save caregiver email and password to authentication for login
      //saveAuth(email, password);


      // Clear the input fields.
      careFNameController.clear();
      careLNameController.clear();
      careAgeController.clear();
      careAddressController.clear();
      careContactNumController.clear();
      careEmailController.clear();
      careUserNameController.clear();
      carePasswordController.clear();
      careStatusController.clear();

      Navigator.of(context).pop();

      // Send a verification email to the user
    //sendVerificationEmail();
  } else {
    // Handle empty input or display an error message.
  }
}
/*
// Function to create a Firebase Authentication user
Future<void> saveAuth(String email, String password) async {
  try {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Error creating Firebase Authentication user: $e')),
    );
  }
}

  // Function to send a verification email to the user
  void sendVerificationEmail() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null && !user.emailVerified) {
      try {
        await user.sendEmailVerification();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Verification email sent to ${user.email}'),
          ),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error sending verification email: $e'),
          ),
        );
      }
    }
  }*/
}
