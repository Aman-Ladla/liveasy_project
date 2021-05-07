import 'package:flutter/material.dart';
import 'package:liveasy_project/login.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _phoneController = TextEditingController();

  // Future<bool> loginUser(String phone, BuildContext context) async {
  //   FirebaseAuth _auth = FirebaseAuth.instance;
  //
  //   _auth.verifyPhoneNumber(
  //       phoneNumber: phone,
  //       timeout: Duration(seconds: 10),
  //       verificationCompleted: (AuthCredential credential) async {
  //         Navigator.of(context).pop();
  //
  //         UserCredential result = await _auth.signInWithCredential(credential);
  //
  //         User user = result.user;
  //
  //         if (user != null) {
  //           Navigator.push(
  //               context,
  //               MaterialPageRoute(
  //                   builder: (context) => HomeScreen(
  //                         user: user,
  //                       )));
  //         } else {
  //           print("Error");
  //         }
  //
  //         //This callback would gets called when verification is done automatically
  //       },
  //       verificationFailed: (FirebaseAuthException exception) {
  //         print(exception);
  //         print('something is wrong');
  //       },
  //       codeSent: (String verificationId, [int forceResendingToken]) {
  //         showDialog(
  //           context: context,
  //           barrierDismissible: false,
  //           builder: (context) {
  //             return AlertDialog(
  //               title: Text("Give the code?"),
  //               content: Column(
  //                 mainAxisSize: MainAxisSize.min,
  //                 children: <Widget>[
  //                   TextField(
  //                     controller: _codeController,
  //                   ),
  //                 ],
  //               ),
  //               actions: <Widget>[
  //                 TextButton(
  //                   child: Text("Confirm"),
  //                   onPressed: () async {
  //                     final code = _codeController.text.trim();
  //                     AuthCredential credential = PhoneAuthProvider.credential(
  //                         verificationId: verificationId, smsCode: code);
  //
  //                     UserCredential result =
  //                         await _auth.signInWithCredential(credential);
  //
  //                     User user = result.user;
  //
  //                     if (user != null) {
  //                       Navigator.push(
  //                           context,
  //                           MaterialPageRoute(
  //                               builder: (context) => HomeScreen(
  //                                     user: user,
  //                                   )));
  //                     } else {
  //                       print("Error");
  //                     }
  //                   },
  //                 )
  //               ],
  //             );
  //           },
  //         );
  //       },
  //       codeAutoRetrievalTimeout: null);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(32),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 80.0,
              ),
              Text(
                "Please enter your mobile number",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                'You\'ll receive a 6 digit code \n to verify next',
                style: TextStyle(
                  color: Colors.black54,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 40.0,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                    // prefix: Padding(
                    //   padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    //   child: Text(
                    //     '+91  -',
                    //     style: TextStyle(
                    //         color: Colors.black,
                    //         fontSize: 16,
                    //         fontWeight: FontWeight.w500),
                    //   ),
                    // ),
                    // prefixStyle: TextStyle(
                    //     color: Colors.black,
                    //     fontSize: 16,
                    //     fontWeight: FontWeight.w500),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            'images/flag.png',
                            width: 30,
                            height: 20,
                            fit: BoxFit.fitWidth,
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            '+91  -',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                    hintText: "Mobile Number"),
                controller: _phoneController,
              ),
              SizedBox(
                height: 30.0,
              ),
              Material(
                color: Color(0xff2E3B62),
                child: MaterialButton(
                  minWidth: double.maxFinite,
                  onPressed: () {
                    final phone = '+91${_phoneController.text.trim()}';
                    print(phone);
                    Login.loginUser(phone, context, 1);
                    //loginUser(phone, context);
                  },
                  child: Text(
                    'CONTINUE',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
