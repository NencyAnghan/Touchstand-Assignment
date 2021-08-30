import 'package:flutter/material.dart';

class BedRoomScreen extends StatefulWidget {
  final String name, lights;

  const BedRoomScreen({Key key, this.name, this.lights}) : super(key: key);

  @override
  _BedRoomScreenState createState() => _BedRoomScreenState();
}

class _BedRoomScreenState extends State<BedRoomScreen> {
  String name, lights;
  double currentSliderValue=20;
Color bulbColor=Colors.orangeAccent;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    name = widget.name;
    lights = widget.lights;
  }

  Widget _buildSingleColor(Color color){
    return  InkWell(
      onTap: (){
        setState(() {
          bulbColor=color;
        });
      },
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(Radius.circular(24),
          ),
        ),
      ),
    );
  }

  Widget _buildSingleScene( String name, List<Color> colors){
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 28,vertical: 16),
        child: Row(
          children: [
            Image(
              image: AssetImage('assets/png/surface2.png'),
              height: 20,
            ),
            SizedBox(
              width: 24,
            ),
            Text(
              name,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                  letterSpacing: 0.5),
            ),
          ],
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment(0.8, 0.0), // 10% of the width, so there are ten blinds.
            colors: colors, // red to yellow
          ),
        ),
      ),
    );
  }

  Widget _buildSingleLight(
      String light, String icon, Color nameColor, Color containerColor) {
    return InkWell(
      onTap: (){

      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Image(
              image: AssetImage(icon),
              height: 20,
            ),
            SizedBox(
              width: 12,
            ),
            Text(
              light,
              style: TextStyle(
                  color: nameColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                  letterSpacing: 0.5),
            ),
          ],
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
          color: containerColor,
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 24),
                child: Column(
                  children: [
                    SizedBox(
                      height: 60,
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Image(
                            height: 20,
                            image: AssetImage('assets/png/backarrow.png'),
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          'Bed',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 32,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'Room',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 32,
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      lights,
                      style: TextStyle(
                        color: Colors.orangeAccent,
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 24),
                height: 120,
                child: Stack(
                  children: [
                    /*Positioned(
                      top: 82,
                      left: 36,
                      child: Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.all(Radius.circular(24)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withAlpha(255-currentSliderValue.toInt()),
                              spreadRadius: 5,
                              blurRadius: 3,
                              offset: Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                      ),
                    ),*/
                    Positioned(
                      top: 82,
                      left: 36,
                      child: Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: bulbColor.withAlpha(currentSliderValue.toInt()),
                          borderRadius: BorderRadius.all(Radius.circular(24)),
                          boxShadow: [
                            BoxShadow(
                              color: bulbColor.withAlpha((currentSliderValue*0.5).toInt()),
                              spreadRadius: 5,
                              blurRadius: 3,
                              offset: Offset(0, 3),

                            ),
                          ],
                        ),
                      ),
                    ),
                    Image(
                      fit: BoxFit.fitWidth,
                      image: AssetImage('assets/png/bulbnew.png'),
                    ),

                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 24,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                SizedBox(
                  width: 24,
                ),
                _buildSingleLight('Main Light', 'assets/png/surface1.png',
                    Color(0xff02347d), Colors.white),
                SizedBox(
                  width: 24,
                ),
                _buildSingleLight('Desk Lights', 'assets/png/desk.png',
                    Colors.white, Color(0xff02347d)),
                SizedBox(
                  width: 24,
                ),
                _buildSingleLight('Bed Light', 'assets/png/newbed.png',
                    Color(0xff02347d), Colors.white),
                SizedBox(
                  width: 24,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 32,
          ),
          Expanded(
            child: Container(
              clipBehavior: Clip.none,
              padding: EdgeInsets.all(24),
              width: MediaQuery.of(context).size.width,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    right: 16,
                   top: -40,
                    child: Container(
                      padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(24)),
                      ),
                      child: Image(
                        image: AssetImage('assets/png/power.png'),
                        height: 20,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Intensity',
                      style: TextStyle(
                        fontSize: 24,
                        color: Color(0xff02347d),
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.5,
                      ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          Image(
                            image: AssetImage('assets/png/solution1.png'),
                            height: 20,
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Expanded(
                            child: Slider(
                              value: currentSliderValue,
                              min: 0,
                              max: 255,
                              activeColor: Colors.orangeAccent.shade100,
                              inactiveColor:Colors.grey.shade200 ,
                              onChanged: (double value) {
                                setState(() {
                                  currentSliderValue = value;
                                });
                              },
                            ),
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Image(
                            image: AssetImage('assets/png/solution.png'),
                            height: 20,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      Text('Colors',
                        style: TextStyle(
                          fontSize: 24,
                          color: Color(0xff02347d),
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.5,
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         _buildSingleColor(Colors.redAccent.shade200),
                         _buildSingleColor(Colors.greenAccent.shade200),
                         _buildSingleColor(Colors.lightBlueAccent),
                         _buildSingleColor(Colors.deepPurpleAccent.shade100),
                         _buildSingleColor(Colors.purpleAccent.shade100),
                         _buildSingleColor(Colors.orangeAccent),
                         Container(
                           padding: EdgeInsets.all(8),
                           child: Icon(Icons.add,color: Color(0xff02347d),size: 20,),
                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.all(
                               Radius.circular(24),
                             ),
                             color: Colors.white,
                           ),
                         ),
                       ],
                     ),
                      SizedBox(
                        height: 32,
                      ),

                      Text('Scenes',
                        style: TextStyle(
                          fontSize: 24,
                          color: Color(0xff02347d),
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.5,
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildSingleScene( 'Birthday', [ Colors.redAccent.shade200,
                            Colors.redAccent.shade100]),
                          SizedBox(
                            width: 24,
                          ),
                          _buildSingleScene( 'Party', [ Colors.deepPurpleAccent.shade200,
                            Colors.deepPurpleAccent.shade100]),
                        ],
                      ),

                      SizedBox(
                        height: 24,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildSingleScene( 'Relax', [ Colors.lightBlueAccent.shade200,
                            Colors.lightBlueAccent.shade100]),
                          SizedBox(
                            width: 24,
                          ),
                          _buildSingleScene( 'Fun', [ Colors.greenAccent.shade200,
                            Colors.greenAccent.shade100]),
                        ],
                      ),

                    ],
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
