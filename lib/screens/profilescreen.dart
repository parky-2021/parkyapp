import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class Profilescreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(245, 210, 31, 1),
        body: Column(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.25,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                
                child: Column(
                  
                  
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('Account',style: TextStyle(fontSize: 22,fontWeight: FontWeight.w600),),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                       
                            Text(
                              '9246699902',
                              style: TextStyle(color: Theme.of(context).buttonColor,fontSize: 25,fontWeight: FontWeight.w500),
                            ),
                           
                        
                        Icon(FontAwesome5Solid.user_circle,size: 60,)

                      ],
                    )
                  ],
                ),
              ),
            ),
            Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(100)),
              color: Colors.white
            ),
              padding: EdgeInsets.symmetric(horizontal:20,vertical: 20,),
              
              height: MediaQuery.of(context).size.height*0.75,
              child: Column(
                
                children: [
                  ListTile(
                    title:Text('My Vehicle',style: TextStyle(fontWeight: FontWeight.w700),) ,subtitle:Text('Add Vehicle information') ,leading:Icon(FontAwesome5Solid.car_alt) ,onTap: (){},
                  ),
                  ListTile(
                title:Text('Pre Saved',style: TextStyle(fontWeight: FontWeight.w700)) ,subtitle:Text('Previously saved places') ,leading:Icon(Icons.map) ,onTap: (){},
              ),
               ListTile(
                title:Text('Log Out',style: TextStyle(fontWeight: FontWeight.w700)) ,subtitle:Text('Log out of your accont') ,leading:Icon(Icons.logout) ,onTap: (){},
              ),
           
                ],
              ),
            )
          ],
        ));
  }
}
