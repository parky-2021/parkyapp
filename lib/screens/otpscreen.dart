import 'package:firebase_auth/firebase_auth.dart';
import 'package:otp_text_field/otp_text_field.dart';

import 'package:flutter/material.dart';
import 'package:otp_text_field/style.dart';


class OtpScreen extends StatefulWidget {
  static const routename = 'Otpscreen';
  final Function signinwithphoneauth;
  final String verificationid;
  OtpScreen(this.signinwithphoneauth, this.verificationid);

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {







  final otpcontroller = TextEditingController();
  bool isloading = false;
  String otp = '';
  @override
  Widget build(BuildContext context) {
    return isloading
        ? Scaffold(
            body: Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              ),
            ),
          )
        : Scaffold(
            backgroundColor: Theme.of(context).primaryColor,
            resizeToAvoidBottomInset: false,
            body: Column(children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.25,
                width: double.infinity,
                decoration: BoxDecoration(

                    // gradient: LinearGradient(
                    //     begin: Alignment.topLeft,
                    //     end: Alignment.bottomRight,
                    //     colors: [Colors.white, Colors.yellow.shade700])
                    ),
                child: Center(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Enter your ',
                        style: TextStyle(
                            color: Theme.of(context).buttonColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w500)),
                    Text(
                      'OTP',
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                  ],
                )),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.75,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(100))),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 150),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      OTPTextField(
                        length: 6,
                        width: MediaQuery.of(context).size.width - 30,
                        fieldWidth: 50,
                        style: TextStyle(fontSize: 18),
                        fieldStyle: FieldStyle.box,
                        textFieldAlignment: MainAxisAlignment.spaceBetween,
                        onCompleted: (pin) {
                          otp = pin;
                        },
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      FlatButton(
                        height: 50,
                        onPressed: () async {
                          setState(() {
                            isloading = true;
                          });
                          PhoneAuthCredential phoneauthcredential =
                              PhoneAuthProvider.credential(
                                  verificationId: widget.verificationid,
                                  smsCode: otp);

                          widget.signinwithphoneauth(phoneauthcredential);
                         

                          /* setState(() {
                            isloading = false;
                          }); */
                        },
                        child: Text(
                          'verify',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                        color: Theme.of(context).primaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      )
                    ],
                  ),
                ),
              ),
            ]),
          );

    //
    // Scaffold(
    //     body: Stack(children: [
    //   ConstrainedBox(
    //     constraints: BoxConstraints.expand(),
    //     child: RotatedBox(
    //         quarterTurns: 2,
    //         child: Image.asset(
    //           'assets/images/park.jpg',
    //           height: double.infinity,
    //           fit: BoxFit.fill,
    //         )),
    //   ),
    //   Center(
    //     child: ClipRRect(
    //       child: BackdropFilter(
    //         filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
    //         child: Container(
    //           height: 350,
    //           width: 300,
    //           child: Container(
    //             child: Padding(
    //               padding: const EdgeInsets.all(20.0),
    //               child: Column(
    //                 mainAxisAlignment: MainAxisAlignment.spaceAround,
    //                 crossAxisAlignment: CrossAxisAlignment.stretch,
    //                 children: [
    //                   Center(
    //                       child: Text(
    //                     'Details',
    //                     style:
    //                         TextStyle(color: Colors.yellow[400], fontSize: 40),
    //                   )),
    //                   Card(
    //                     elevation: 10,
    //                     child: ListTile(
    //                       title: Text('Phonenumber',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.yellow[400]),),
    //                       subtitle: Text('Phonenumber',style: TextStyle(color: Colors.black),),
    //                     ),
    //                   ),
    //                   TextFormField(
    //                     keyboardType: TextInputType.phone,
    //                     style: TextStyle(color: Colors.white),
    //                     decoration: InputDecoration(
    //                       focusedBorder: OutlineInputBorder(
    //                           borderSide: BorderSide(color: Colors.yellow)),
    //                       enabledBorder: OutlineInputBorder(
    //                           borderSide: BorderSide(color: Colors.white)),
    //                       labelStyle: TextStyle(color: Colors.white),
    //                       labelText: 'OTP',
    //                       border: OutlineInputBorder(
    //                         borderRadius: BorderRadius.all(Radius.circular(10)),
    //                       ),
    //                     ),
    //                   ),

    //                 ],
    //               ),
    //             ),
    //           ),
    //           decoration: BoxDecoration(
    //             color: Colors.grey.shade200.withOpacity(0.1),
    //           ),
    //         ),
    //       ),
    //     ),
    //   )
    // ]));
  }
}
