import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project/provider/phoneauth.dart';
import 'package:project/screens/detailsscreen.dart';
import 'package:project/screens/otpscreen.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Loginsheet extends StatefulWidget {
  @override
  _LoginsheetState createState() => _LoginsheetState();
}

class _LoginsheetState extends State<Loginsheet> {
  FirebaseAuth _auth = FirebaseAuth.instance;

  String? verificationId;

  String? token;

  Future<void> authenticate(phonenumber) async {
    var url = Uri.parse("http://10.0.2.2:8080/api/authenticate_user");

    try {
      final response =
          await http.post(url, body: json.encode({'mobile': phonenumber}));
      final responsedata = json.decode(response.body);

      token = responsedata["token"];
      print(token);
    } catch (error) {
      throw (error);
    }
  }

  bool isloading = false;
  void signinwithphoneauth(PhoneAuthCredential phoneauthcredential) async {
    setState(() {
      isloading = true;
    });

    try {
      final authcredential =
          await _auth.signInWithCredential(phoneauthcredential);
      setState(() {
        isloading = false;
      });

      if (authcredential.user != null) {
        authenticate(phonecontroller.text);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Detailsscreen()));
      }
    } on FirebaseAuthException catch (e) {
      setState(() {
        isloading = false;
      });
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message.toString())));
    }
  }

  final phonecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isloading
          ? Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              ),
            )
          : Card(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Login',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 40,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    TextFormField(
                      controller: phonecontroller,
                      keyboardType: TextInputType.phone,
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                      decoration: InputDecoration(
                        labelText: 'Phone Number',
                        hintText: 'Enter your phone number',
                        hintStyle: TextStyle(color: Colors.black, fontSize: 13),
                      ),
                      validator: (value) {
                        if (value == null) {
                          return 'Please type your Phonenumber';
                        }
                      },
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    // ignore: deprecated_member_use

                    FlatButton(
                      height: 50,
                      onPressed: () async {
                        setState(() {
                          isloading = true;
                        });
                        await _auth.verifyPhoneNumber(
                            phoneNumber: '+91' + phonecontroller.text,
                            verificationCompleted: (phoneAuthCredential) async {
                              setState(() {
                                isloading = false;
                              });
                            },
                            verificationFailed: (verificationfailed) async {
                              setState(() {
                                isloading = false;
                              });
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text(verificationfailed.message
                                          .toString())));
                            },
                            codeSent: (verificationid, resendingtoken) async {
                              verificationId = verificationid;
                              setState(() {
                                isloading = false;
                              });
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => OtpScreen(
                                          signinwithphoneauth,
                                          verificationId!)));
                            },
                            codeAutoRetrievalTimeout:
                                (verificationid) async {});
                      },
                      child: Text(
                        'submit',
                        style: TextStyle(fontSize: 20),
                      ),
                      color: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
