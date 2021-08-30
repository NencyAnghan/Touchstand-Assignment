import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'bedroom_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget _buildSingleRoom(
      {String name, String image, String lights}) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(
              height: 48,
              image: AssetImage(image),
            ),
            SizedBox(
              height: 24,
            ),
            Text(
              name,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              lights,
              style: TextStyle(
                color: Colors.orangeAccent,
                fontWeight: FontWeight.w700,
                fontSize: 14,
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(24)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 2,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1948b5),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 44),
            // height: 250,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 24),
                  child: Text(
                    'Control \nPanel',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 32,
                        letterSpacing: 0.8),
                  ),
                ),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>BedRoomScreen(name: 'Bed \nRoom',lights: '4 Lights',)),);
                  },
                  child: Image(
                    height: 100,
                    image: AssetImage('assets/png/user.png'),
                  ),
                ),
              ],
            ),
            /* decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/png/Circles.png'),
                  fit: BoxFit.cover,
                ),
              )*/
          ),
          SizedBox(
            height: 16,
          ),
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.fromLTRB(24, 0, 24, 0),
              child: ListView(
                children: [
                  Text(
                    'All Rooms',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                        letterSpacing: 0.4),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildSingleRoom(
                          name: 'Bed room',
                          image: 'assets/png/bed.png',
                          lights: '4 Lights',
                          ),
                      SizedBox(
                        width: 24,
                      ),
                      _buildSingleRoom(
                          name: 'Living room',
                          image: 'assets/png/room.png',
                          lights: '2 Lights'),
                    ],
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildSingleRoom(
                          name: 'Kitchen',
                          image: 'assets/png/kitchen.png',
                          lights: '5 Lights'),
                      SizedBox(
                        width: 24,
                      ),
                      _buildSingleRoom(
                          name: 'Bathroom',
                          image: 'assets/png/bathtube.png',
                          lights: '1 Lights'),
                    ],
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildSingleRoom(
                          name: 'Outdoor',
                          image: 'assets/png/house.png',
                          lights: '5 Lights'),
                      SizedBox(
                        width: 24,
                      ),
                      _buildSingleRoom(
                          name: 'Balcony',
                          image: 'assets/png/balcony.png',
                          lights: '2 Lights'),
                    ],
                  ),
                  SizedBox(
                    height: 24,
                  ),
                ],
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(32),
                  topLeft: Radius.circular(32),
                ),
                color: Color(0xfff0f4f5),
              ),
            ),
          ),
          Container(
            color: Colors.white,
            padding: EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image(
                  image: AssetImage('assets/png/bulb.png'),
                  height: 20,
                ),
                Image(
                  image: AssetImage('assets/png/home_icon.png'),
                  height: 20,
                ),
                Image(
                  image: AssetImage('assets/png/settings_icon.png'),
                  height: 20,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
