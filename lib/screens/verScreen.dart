import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../login.dart';
import 'homeScreen.dart';

class VerScreen extends StatelessWidget {
  final _codeController = TextEditingController();
  final String verificationId;
  final String phone;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  VerScreen(this.verificationId, this.phone);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 80.0,
          ),
          Text(
            "Verify Phone",
            style: TextStyle(
                color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(
            'Code is sent to $phone',
            style: TextStyle(
              color: Colors.black54,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 40.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: PinCodeTextField(
              keyboardType: TextInputType.number,
              boxShadows: [
                BoxShadow(
                  color: Color(0xff93D2F3),
                )
              ],
              controller: _codeController,
              appContext: context,
              length: 6,
              onChanged: (String value) {},
            ),
          ),
          SizedBox(
            height: 40.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Didn\'t receive the code? ',
                style: TextStyle(
                  color: Colors.black54,
                ),
                textAlign: TextAlign.center,
              ),
              TextButton(
                  onPressed: () {
                    print('requesting the code again');
                    Login.loginUser(phone, context, 2);
                  },
                  child: Text('Request Again')),
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          Material(
            color: Color(0xff2E3B62),
            child: MaterialButton(
              minWidth: double.maxFinite,
              onPressed: () async {
                // final phone = '+91${_phoneController.text.trim()}';
                // print(phone);
                // loginUser(phone, context);
                final code = _codeController.text.trim();
                AuthCredential credential = PhoneAuthProvider.credential(
                    verificationId: verificationId, smsCode: code);

                UserCredential result =
                    await _auth.signInWithCredential(credential);

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
              },
              child: Text(
                'VERIFY AND CONTINUE',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
