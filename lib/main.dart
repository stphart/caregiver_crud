import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'App_Services/addcaregiver.dart';
import 'App_Services/editcaregiver.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: 'AIzaSyBWNWbmCjVFX1GEQel6LQ7F8cIL-gDGcs',
      appId: '1:418950512097:android:7b1fd64c0c6e67985166a0',
      messagingSenderId: '418950512097',
      projectId: 'demension-v1-database',
      databaseURL:
          'https://demension-v1-database-default-rtdb.asia-southeast1.firebasedatabase.app',
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfileScreen(),
    );
  }
}

// Function to fetch medication data from Firestore
Stream<QuerySnapshot> fetchSMS() {
  return FirebaseFirestore.instance
      .collection('device')
      .doc('31y1sQrytWv6r8gmNSwg')
      .collection('admin')
      .doc('Ardvn3AF3sEqkz1nC5Uc')
      .collection('caregiver') // Access the 'SMS' subcollection
      .snapshots();
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Caregiver Settings'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: fetchSMS(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  final smsDocs = snapshot.data!.docs;
                  return ListView.builder(
                    itemCount: smsDocs.length,
                    itemBuilder: (context, index) {
                      final data =
                          smsDocs[index].data() as Map<String, dynamic>;
                      final careFName = data['careFName'];
                      final careLName = data['careLName'];
                      final careAge = data['careAge'];
                      final careAddress = data['careAddress'];
                      final careContactNum = data['careContactNum'];
                      final careEmail= data['careEmail'];
                      final careUserName = data['careUserName'];
                      final carePassword = data['carePassword'];
                      final careStatus = data['careStatus'];
                      return GestureDetector(
                        onTap: () {
                          final documentID =
                              smsDocs[index].id; // Capture the document ID
                          // Navigate to the EditSMSPage when a card is tapped
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => EditCaregiverPage(
                                careFName : careFName,
                                careLName : careLName,
                                careAge : careAge,
                                careAddress : careAddress,
                                careContactNum : careContactNum,
                                careEmail : careEmail,
                                careUserName : careUserName, 
                                carePassword : carePassword,
                                careStatus : careStatus,
                                documentID: documentID, // Pass the document ID
                              ),
                            ),
                          );
                        },
                        child: Card(
                          elevation: 3, // Add a shadow to the card
                          margin:
                              EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          child: ListTile(
                            title: Text(
                              careFName + " " + careLName,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            subtitle: Text(
                              'Age: $careAge\nAddress: $careAddress \Mobile Number: $careContactNum',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => AddCaregiverPage(),
                  ),
                );
              },
              child: Text('Add Caregiver'),
            ),
          ),
        ],
      ),
    );
  }
}
