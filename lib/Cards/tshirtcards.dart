import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:planningpoker2/Cards/Colors.dart';
import 'package:planningpoker2/Cards/imagescreen.dart';
import 'package:planningpoker2/Cards/Wrapper.dart';
import 'package:planningpoker2/Cards/card.dart';
import 'package:planningpoker2/Cards/standardcards.dart';
import 'package:planningpoker2/size.dart';
class Card_poker_tshirt extends StatefulWidget {
  @override
  _Card_poker_tshirtState createState() => _Card_poker_tshirtState();
}

class _Card_poker_tshirtState extends State<Card_poker_tshirt> {
  Widget popupMenuButton()
  {
    return PopupMenuButton<String>(
      icon:Icon(
        Icons.expand_more,
        color: Colors.black,

      ),
      itemBuilder: (BuildContext context)=><PopupMenuEntry<String>>[
        PopupMenuItem<String>(
          value: "one",
          child: Text('Select'),
        ),
        PopupMenuItem<String>(
          value: "two",
          child: Text('Fabonacci'),
        ),
        PopupMenuItem<String>(
          value: "three",
          child: Text('Standard'),
        ),
        PopupMenuItem<String>(
          value: "four",
          child: Text('Tshirt'),
        ),

      ],
      onSelected: (retval)
      {
        if(retval=="two")
        {
          Navigator.push(context, MaterialPageRoute(builder: (context) => Card_poker()));
        }

        if(retval=="three")
        {
          Navigator.push(context, MaterialPageRoute(builder: (context) => Card_poker_standard()));
        }
        if(retval=="four")
        {
          Navigator.push(context, MaterialPageRoute(builder: (context) => Card_poker_tshirt()));
        }

      },


    );

  }
  @override
  Widget build(BuildContext context) {
    return
      MaterialApp(
        home: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              actions: [
                /*IconButton(
            icon:Icon(
                    Icons.expand_more,
                    color: Colors.black,

                  )
                ),*/
                popupMenuButton(),
              ],

            ),

            body: Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 100, 0.0, 0.0),
              child: Column(

                children: [

                  Center(
                    child: CarouselSlider
                      (
                      options: CarouselOptions(
                        height: SizeConfig.blockSizeVertical * 60,
                        enlargeCenterPage: true,


                      ),

                      items: colors.map((i){
                        return Builder(builder: (BuildContext context){return Container(
                          width:  SizeConfig.blockSizeHorizontal * 70,
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),

                            color: i.color,


                          ),

                          child: CustomPaint(
                            painter: ColorPainter(),
                            child: GestureDetector(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('${i.number}',style: TextStyle(
                                      fontSize: 50,
                                      color: Colors.black,
                                      fontStyle: FontStyle.italic,
                                    ),),
                                  ),

                                  SizedBox(height: 60),
                                  Center(
                                    child: Text('${i.number}',style: TextStyle(
                                      fontSize: 150,
                                      color: Colors.black,
                                      fontStyle: FontStyle.italic,
                                    ),),
                                  ),
                                ],
                              ),
                              onTap: ()
                              {
                                Navigator.push<Widget>(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => wrapper(i),
                                  ),
                                );
                              },
                            ),
                          ),

                        );
                        });

                      }).toList(),





                    ),

                  ),
                  SizedBox(height: 50,),
                  /*Center(
                  child: CarouselSlider
                    (
                    options: CarouselOptions(
                      height: 50,
                      enlargeCenterPage: true,
                     viewportFraction: 0.2,

                    ),

                    items: colors.map((i){
                      return Builder(builder: (BuildContext context){return Container(
                        width: 200,
                    //    margin: EdgeInsets.symmetric(horizontal:0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),

                          color: i.color,


                        ),
                        child:
                            Center(
                              child: Text('${i.number}',style: TextStyle(
                                fontSize: 40,
                                color: Colors.white,
                                fontStyle: FontStyle.italic,
                              ),),


                        ),

                      );
                      });

                    }).toList(),




                  ),

                ),*/
                ],
              ),
            ),
          ),
        ),
      );

  }

  List<color_number> colors=
  [
    color_number(color:Colors.pink[200],number: 'XS'),
    color_number(color:Colors.blue[200],number: 'S'),
    color_number(color:Colors.green[200],number: 'M'),
    color_number(color:Colors.cyan[200],number: 'L'),
    color_number(color:Colors.purple[200],number: 'XL'),
    color_number(color:Colors.orange[200],number: '2XL'),
    //color_number(color:Colors.deepPurple[200],number: '13'),
    //color_number(color:Colors.blue[200],number: '20'),
    //color_number(color:Colors.pink[200],number: '34'),
    //color_number(color:Colors.deepOrange[200],number: '55'),
    //color_number(color:Colors.blue[200],number: '89'),
    //color_number(color:Colors.yellow[200],number: '144'),


  ];
}
class ColorPainter extends CustomPainter
{
  @override
  void paint(Canvas canvas, Size size){
    final height=size.height;
    final width=size.width;
    Paint paint=Paint();
    Path mainbackground=Path();
    mainbackground.addRect(Rect.fromLTRB(0, 0, width, height));
    paint.color=Colors.white;
    canvas.drawPath(mainbackground, paint);
    Path curvepath=Path();
    paint.style=PaintingStyle.fill;
    curvepath.moveTo(0, height*0.5);
    curvepath.quadraticBezierTo(width*0.3, height*0.3, width*0.5, height*0.5);
    curvepath.quadraticBezierTo(width*0.6, height*0.6, width, height*0.5);
    curvepath.lineTo(width, height);
    curvepath.lineTo(0, height);


    //curvepath.cubicTo(, y1, x2, y2, x3, y3)
    paint.color=Colors.yellow;
    canvas.drawPath(curvepath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate!=this;
  }


}

