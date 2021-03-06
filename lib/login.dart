import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:liveasy_project/screens/homeScreen.dart';
import 'package:liveasy_project/screens/verScreen.dart';

class Login {
  static Future<bool> loginUser(
      String phone, BuildContext context, int i) async {
    FirebaseAuth _auth = FirebaseAuth.instance;

    _auth.verifyPhoneNumber(
        phoneNumber: phone,
        timeout: Duration(seconds: 10),
        verificationCompleted: (AuthCredential credential) async {
          Navigator.of(context).pop();

          UserCredential result = await _auth.signInWithCredential(credential);

          User user = result.user;

          if (user != null) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HomeScreen(
                          user: user,
                        )));
          } else {
            print("Error");
          }

          //This callback would gets called when verification is done automatically
        },
        verificationFailed: (FirebaseAuthException exception) {
          print(exception);
          print('something is wrong');
        },
        codeSent: (String verificationId, [int forceResendingToken]) {
          if (i == 1) {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return VerScreen(verificationId, phone);
            }));
          }
          // showDialog(
          //   context: context,
          //   barrierDismissible: false,
          //   builder: (context) {
          //     return AlertDialog(
          //       title: Text("Give the code?"),
          //       content: Column(
          //         mainAxisSize: MainAxisSize.min,
          //         children: <Widget>[
          //           TextField(
          //             controller: _codeController,
          //           ),
          //         ],
          //       ),
          //       actions: <Widget>[
          //         TextButton(
          //           child: Text("Confirm"),
          //           onPressed: () async {
          //             final code = _codeController.text.trim();
          //             AuthCredential credential = PhoneAuthProvider.credential(
          //                 verificationId: verificationId, smsCode: code);
          //
          //             UserCredential result =
          //                 await _auth.signInWithCredential(credential);
          //
          //             User user = result.user;
          //
          //             if (user != null) {
          //               Navigator.push(
          //                   context,
          //                   MaterialPageRoute(
          //                       builder: (context) => HomeScreen(
          //                             user: user,
          //                           )));
          //             } else {
          //               print("Error");
          //             }
          //           },
          //         )
          //       ],
          //     );
          //   },
          // );
        },
        codeAutoRetrievalTimeout: null);
  }
}
