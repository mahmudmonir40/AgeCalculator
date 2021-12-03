import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class age_calculatorPage extends StatefulWidget {
  const age_calculatorPage({Key? key}) : super(key: key);

  @override
  _age_calculatorPageState createState() => _age_calculatorPageState();
}

class _age_calculatorPageState extends State<age_calculatorPage> {

late int d,m,y;
String days1="",month1="",year1="";

  @override
  Widget build(BuildContext context) {


    return Container(
    height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage("assets/k3.jpg"),
          fit: BoxFit.cover
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [

              Colors.green.withOpacity(0.1),
              Colors.blueGrey.withOpacity(0.4),
              Colors.tealAccent.withOpacity(0.1),
              Colors.blueGrey.withOpacity(0.4),
            ],
                begin: Alignment.centerLeft
            )
        ),


        child: Scaffold(
          backgroundColor: Colors.transparent,

          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title:  Text("Age_Calculator",style: TextStyle(fontSize: 25,fontWeight: FontWeight.normal,color: Colors.teal,fontFamily: "bushetch"),),
            actions: [
              Container(
                height: 150,width: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(150),
                    image: DecorationImage(image: AssetImage("assets/k3.jpg"),
                        fit: BoxFit.cover
                    )
                ),
                child: Row(
                  children: [
                    Text("Age_Calculator !",style: TextStyle(fontSize: 13,fontFamily: "bushetch",fontWeight: FontWeight.normal,color: Colors.teal,),),
                  ],
                ),
              ),
            ],
          ),

          body: Column(
            children: <Widget>[

              SizedBox(
                height: 120,
              ),
              RaisedButton(child: Text("Silect your year of birth !",style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal,color: Colors.white,fontFamily: "bushetch"),),onPressed: (){f1();},color: Colors.teal,),
              new OutlineButton(
                onPressed: () {},
                child:  Text(year1+" "+month1+" "+days1,style: TextStyle(color: Colors.white,fontFamily: "bushetch",fontSize: 25),),
                color: Colors.teal,
              ),

              Spacer(),
              Row(
                children: [
                  Container(
                    height: 300,
                    width: 220,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(300),
                      ),
                      color: Colors.green[100],
                    ),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              height: 50,
                            ),

                            Container(
                              height: 150,width: 150,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(200),
                                  image: DecorationImage(image: AssetImage("assets/k3.jpg"),
                                      fit: BoxFit.cover
                                  )
                              ),
                            ),
                            Text("Age_Calculator",style: TextStyle(fontSize: 13,fontFamily: "bushetch",fontWeight: FontWeight.normal,color: Colors.teal,),),
                          ],
                        )
                      ],
                    ),

                  ),

                ],
              ),

            ],
          ),
        ),


      ),

    );
  }


  Future f1() async {

    DateTime? date1 = await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(1900), lastDate: DateTime.now());
  setState(() {
d=int.parse(DateFormat("dd").format(date1!));
m=int.parse(DateFormat("MM").format(date1));
y=int.parse(DateFormat("yy").format(date1));

int d1=int.parse(DateFormat("dd").format(DateTime.now()));
int m1=int.parse(DateFormat("MM").format(DateTime.now()));
int y1=int.parse(DateFormat("yy").format(DateTime.now()));

int day=finddays(m1,y1);

if(d1-d>0)
  days1=(d1-d).toString()+" days";

else
  {
    days1=(d1+day-d).toString()+" days";
    m1=m1-1;
  }
if(m1-m>0)
  month1=(m1-m).toString()+" months";
else
  {
   month1=(m1+12-m).toString()+" months";
   y1=y1-1;
  }
year1=(y1-y).toString()+" years";



  });


  }
   finddays(int m2,int y2)
   {
     int day2;
     if(m2==1 || m2==3 || m2==5 || m2==7 || m2==8 || m2==10 || m2==12)
     day2= 31;

     else
       if(m2==4 || m2==6 || m2==9 || m2==11)
         day2=30;

       else
         {
           if(y2%4==0)
             day2=29;

           else
             day2=28;
         }
       return day2;
   }

}
