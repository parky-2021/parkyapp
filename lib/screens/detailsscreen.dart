import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project/loginsheet.dart';
import 'package:project/screens/loginscreen.dart';

class Detailsscreen extends StatefulWidget {
  // final String phonenumber;
  // Detailsscreen(this.phonenumber);
  @override
  _DetailsscreenState createState() => _DetailsscreenState();
}

class _DetailsscreenState extends State<Detailsscreen> {
  final namecontroller = TextEditingController();
  final emailcontroller = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              height: MediaQuery.of(context).size.height*0.25,
              width: double.infinity,
              decoration: BoxDecoration(
                  // borderRadius: BorderRadius.only(
                  //     topLeft: Radius.circular(30),
                  //     topRight: Radius.circular(30)),
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Colors.white, Colors.yellow.shade700])),
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'REGISTER',
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'in less than a minute',
                      style: TextStyle(
                          color: Colors.black26,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    )
                  ],
                ),
              )),
          Container(
            decoration: BoxDecoration(
              boxShadow: [BoxShadow(color: Colors.white)],
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50))),
            height: MediaQuery.of(context).size.height*0.75,
            child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: namecontroller,
                      keyboardType: TextInputType.name,
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                      decoration: InputDecoration(
                        labelText: 'Name',
                        hintText: 'Enter your Name',
                        hintStyle: TextStyle(color: Colors.black, fontSize: 13),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    TextFormField(
                      controller: emailcontroller,
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                      decoration: InputDecoration(
                        labelText: 'Email',
                        hintText: 'Enter your Email Address',
                        hintStyle: TextStyle(color: Colors.black, fontSize: 13),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    FlatButton(
                      height: 50,
                      onPressed: () {},
                      child: Text(
                        'Register',
                        style: TextStyle(fontSize: 20),
                      ),
                      color: Colors.yellow[700],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    )
                  ],
                )),
          ),
        ],
      ),

      // floatingActionButton: FloatingActionButton(
      //   onPressed: () async {
      //     await _auth.signOut();
      //     Navigator.pushReplacement(
      //         context, MaterialPageRoute(builder: (context) => Loginsheet()));
      //   },
      //   child: Icon(Icons.logout),
      // ),
    );
  }
}
