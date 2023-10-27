import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EditCaregiverPage extends StatefulWidget {
  final String careFName;
  final String careLName;
  final int careAge;
  final String careAddress;
  final int careContactNum;
  final String careEmail;
  final String careUserName;
  final String carePassword;
  final String careStatus;
  final String documentID;


    EditCaregiverPage(
      {required this.careFName,
      required this.careLName,
      required this.careAge,
      required this.careAddress,
      required this.careContactNum,
      required this.careEmail,
      required this.careUserName,
      required this.carePassword,
      required this.careStatus,
      required this.documentID});

  @override
  _EditCaregiverPageState createState() => _EditCaregiverPageState();
}


class _EditCaregiverPageState extends State<EditCaregiverPage> {
  TextEditingController careFNameController = TextEditingController();
  TextEditingController careLNameController = TextEditingController();
  TextEditingController careAgeController = TextEditingController();
  TextEditingController careAddressController = TextEditingController();
  TextEditingController careContactNumController = TextEditingController();
  TextEditingController careEmailController = TextEditingController();
  TextEditingController careUserNameController = TextEditingController();
  TextEditingController carePasswordController = TextEditingController();
  TextEditingController careStatusController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialize the text controllers with the provided values
    careFNameController.text = widget.careFName;
    careLNameController.text = widget.careLName;
    careAgeController.text = widget.careAge.toString();
    careAddressController.text = widget.careAddress;
    careContactNumController.text = widget.careContactNum.toString();
    careEmailController.text = widget.careEmail;
    careUserNameController.text = widget.careUserName;
    carePasswordController.text = widget.carePassword;
    careStatusController.text = widget.careStatus;

  }

  showDeleteConfirmationDialog(BuildContext context, String documentID) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Delete Confirmation'),
        content: Text('Are you sure you want to delete this item?'),
        actions: <Widget>[
          TextButton(
            child: Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
          ),
          TextButton(
            child: Text('Delete'),
            onPressed: () async {
              // Handle item deletion here
              // You can use the provided 'documentID' to delete the item
              // Implement your delete logic here

              final CollectionReference collectionRef = FirebaseFirestore.instance.collection('device')
                  .doc('31y1sQrytWv6r8gmNSwg')
                  .collection('admin')
                  .doc('Ardvn3AF3sEqkz1nC5Uc')
                  .collection('caregiver');
              
              await collectionRef.doc(documentID).delete().then((_) {
            // Update successful, you can display a success message
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('Number deleted successfully'),
            ));
            Navigator.of(context).pop(); // Navigate back to the previous screen
          }).catchError((error) {
            // Handle errors, you can display an error message
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('Error deleting entry: $error'),
            ));
          });
/*
              // After deleting, you might want to show a success message
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Item deleted successfully'),
                ),
              );

              Navigator.of(context).pop(); // Close the dialog*/
            },
          ),
        ],
      );
    },
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit SMS Entry'),
      ),
      body: Column(
        children: [
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
            decoration: InputDecoration(labelText: 'First Name'),
          ),
          TextFormField(
            controller: careContactNumController,
            decoration: InputDecoration(labelText: 'Last Name'),
          ),
          TextFormField(
            controller: careEmailController,
            decoration: InputDecoration(labelText: 'Age'),
          ),
          TextFormField(
            controller: careUserNameController,
            decoration: InputDecoration(labelText: 'First Name'),
          ),
          TextFormField(
            controller: carePasswordController,
            decoration: InputDecoration(labelText: 'Last Name'),
          ),
          TextFormField(
            controller: careStatusController,
            decoration: InputDecoration(labelText: 'Age'),
          ), 
          ElevatedButton(
            onPressed: () async {
              // Save the edited entry
                String editedfname = careFNameController.text;
                String editedlname = careLNameController.text;
                int editedage = int.parse(careAgeController.text);
                String editedaddress = careAddressController.text;
                int editedcontactnum = int.parse(careContactNumController.text);
                String editedemail = careEmailController.text;
                String editedusername = careUserNameController.text;
                String editedpassword = carePasswordController.text;
                String editedstatus = careStatusController.text; 
             
 
              // Implement logic to save the edited entry in the database
              // You can use the values in editedName, editedNumber, and editedStatus
              // to update the corresponding SMS entry in the database.

              /* Assuming you are using Firebase Firestore for database operations:
              /FirebaseFirestore.instance
                  .collection('device')
                  .doc('31y1sQrytWv6r8gmNSwg')
                  .collection('admin')
                  .doc('Ardvn3AF3sEqkz1nC5Uc')
                  .collection('SMS')
                  .doc(widget.smsNum)
                  .update({
                'smsName': editedName,
                'smsNum': editedNumber,
                'smsStatus': editedStatus,
              }).then((value) {
                // Update successful, you can display a success message
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Entry updated successfully'),
                ));
                Navigator.of(context)
                    .pop(); // Navigate back to the previous screen
              }).catchError((error) {
                // Handle errors, you can display an error message
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Error updating entry: $error'),
                ));
              });
*/
              final CollectionReference collectionRef = FirebaseFirestore
                  .instance
                  .collection('device')
                  .doc('31y1sQrytWv6r8gmNSwg')
                  .collection('admin')
                  .doc('Ardvn3AF3sEqkz1nC5Uc')
                  .collection('caregiver');
              final String documentID =
                  widget.documentID; // Replace with the actual document ID

              // Get the updated data from the text controllers

              // Create a map with the updated data
              Map<String, dynamic> dataToUpdate = {
                'careFName': editedfname,
                'careLName': editedlname,
                'careAge': editedage,
                'careAddress': editedaddress,
                'careContactNum': editedcontactnum,
                'careEmail': editedemail,
                'careUserName': editedusername,
                'carePassword': editedpassword,
                'careStatus': editedstatus,
              };

              // Update the Firestore document with the new data
              await collectionRef
                  .doc(documentID)
                  .update(dataToUpdate)
                  .then((_) {
                // Update successful, you can display a success message
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Entry updated successfully'),
                ));
                Navigator.of(context).pop(); // Navigate back to the previous screen
              }).catchError((error) {
                // Handle errors, you can display an error message
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Error updating entry: $error'),
                ));
              });
            },
            child: Text('Update'),
          ),
          ElevatedButton(
            onPressed: () async {
              /*
              // Implement logic to delete the SMS entry in the database based on widget.smsNum.
              // You can use the widget.smsNum to identify and delete the corresponding entry.
              // Assuming you are using Firebase Firestore:
              FirebaseFirestore.instance
                  .collection('device')
                  .doc('31y1sQrytWv6r8gmNSwg')
                  .collection('admin')
                  .doc('Ardvn3AF3sEqkz1nC5Uc')
                  .collection('SMS')
                  .doc(widget.smsNum)
                  .delete()
                  .then((value) {
                // Deletion successful, you can display a success message
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Entry deleted successfully'),
                ));
                Navigator.of(context)
                    .pop(); // Navigate back to the previous screen
              }).catchError((error) {
                // Handle errors, you can display an error message
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Error deleting entry: $error'),
                ));
              });*/

              // To delete a Firestore document, you need to specify the document's reference.
              // Replace 'collectionName' with your Firestore collection name and 'documentID' with the ID of the document to delete.
/*
              final CollectionReference collectionRef = FirebaseFirestore
                  .instance
                  .collection('device')
                  .doc('31y1sQrytWv6r8gmNSwg')
                  .collection('admin')
                  .doc('Ardvn3AF3sEqkz1nC5Uc')
                  .collection('caregiver');
              final String documentID =
                  widget.documentID; // Replace with the actual document ID
              await collectionRef.doc(documentID).delete().then((_) {
                // Update successful, you can display a success message
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Number deleted successfully'),
                ));
                Navigator.of(context)
                    .pop(); // Navigate back to the previous screen
              }).catchError((error) {
                // Handle errors, you can display an error message
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Error deleting entry: $error'),
                ));
              });*/
              final String documentID = widget.documentID;
              showDeleteConfirmationDialog(context, documentID);
              Navigator.of(context).pop();
            },
            child: Text('Delete'),
          ),
        ],
      ),
    );
  }
}
