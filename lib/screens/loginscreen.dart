// import 'dart:ui';

// import 'package:flutter/material.dart';
// import 'package:project/screens/otpscreen.dart';
// import '../loginsheet.dart';

// class Phonenumberscreen extends StatelessWidget {
//   void showloginsheet(BuildContext ctx) {
//     showModalBottomSheet(
//         shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(30), topRight: Radius.circular(30))),
//         context: ctx,
//         builder: (_) {
//           return GestureDetector(
//             onTap: () {},
//             behavior: HitTestBehavior.opaque,
//             child: Loginsheet(),
//           );
//         });
//   }


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.only(top: 200),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20),
//               child: Container(
//                 child: Image.asset(
//                   'assets/images/park.png',
//                 ),
//               ),
//             ),
//             FlatButton(
//               height: 60,
//               onPressed: () => showloginsheet(context),
//               child: Text(
//                 'Get started',
//                 style: TextStyle(fontSize: 20),
//               ),
//               color: Colors.yellow[700],
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(30),
//                       topRight: Radius.circular(30))),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }












































































// // Scaffold(
// //         body: Stack(children: [
// //       ConstrainedBox(
// //         constraints: BoxConstraints.expand(),
// //         child: RotatedBox(
// //             quarterTurns: 2,
// //             child: Image.asset(
// //               'assets/images/park.jpg',
// //               height: double.infinity,
// //               fit: BoxFit.fill,
// //             )),
// //       ),
// //       Center(
// //         child: ClipRRect(
// //           child: BackdropFilter(
// //             filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
// //             child: Container(
// //               height: 300,
// //               width: 300,
// //               child: Container(
// //                 child: Padding(
// //                   padding: const EdgeInsets.all(20.0),
// //                   child: Column(
// //                     mainAxisAlignment: MainAxisAlignment.spaceAround,
// //                     crossAxisAlignment: CrossAxisAlignment.stretch,
// //                     children: [
// //                       Center(
// //                           child: Text(
// //                         'Login',
// //                         style:
// //                             TextStyle(color: Colors.yellow[400], fontSize: 40),
// //                       )),
                     
               
// //                     ],
// //                   ),
// //                 ),
// //               ),
// //               decoration: BoxDecoration(
// //                 color: Colors.grey.shade200.withOpacity(0.1),
// //               ),
// //             ),
// //           ),
// //         ),
// //       )
// //     ]));
// //   }
// // }
