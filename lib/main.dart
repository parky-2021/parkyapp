import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project/loginsheet.dart';
import 'package:project/screens/detailsscreen.dart';
import 'package:project/screens/otpscreen.dart';
import './screens/loginscreen.dart';
import './screens/profilescreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        buttonColor: Color.fromRGBO(46, 45, 45, 1),
        primaryColor: Color.fromRGBO(245, 210, 31, 1),
        accentColor: Colors.yellowAccent,
      ),
      title: 'PARKING',
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      
      home:Loginsheet() ,
    );
  }
}

// class Initialize extends StatefulWidget {
//   @override
//   _InitializeState createState() => _InitializeState();
// }

// class _InitializeState extends State<Initialize> {
//   FirebaseAuth?_auth;
//   User? _user;
//   bool isloading = true;
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _auth = FirebaseAuth.instance;
//      _user = _auth!.currentUser;

//     isloading = false;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return isloading
//         ? Scaffold(
//             body: Center(
//               child: CircularProgressIndicator(),
//             ),
//           )
//         : _user == null
//             ? Loginsheet()
//             : Homescreen();
//   }
// }
