import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI App',
      home: HomePage(),
    ),
  );
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
    int _genderselect = 0;
    double BMR;
    String _bmr;

    TextEditingController _ctrlWeight = TextEditingController();
    TextEditingController _ctrlHeight = TextEditingController();
    TextEditingController _ctrlage = TextEditingController();

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        //1.1 จงเขียนโค้ดแสดงข้อความที่ App Bar ดังรูป (2 คะแนน)
        appBar: AppBar(
          title: Text(
            'BMI App',
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 25.0,
              ),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 25.0,
                  ),
                  Image.asset(
                    'assets/images/bmi_icon.png',
                    height: 100.0,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.wc),
                      Radio(
                        value: 0,
                        groupValue: _genderselect,
                        onChanged: (data) {
                          setState(() {
                            _genderselect = data;
                          });
                        },
                      ),
                      Text(
                        'ชาย',
                      ),
                      Radio(
                        value: 1,
                        groupValue: _genderselect,
                        onChanged: (data) {
                          setState(() {
                            _genderselect = data;
                          });
                        },
                      ),
                      Text(
                        'หญิง',
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            icon: Icon(
                              FontAwesomeIcons.weight,
                              color: Colors.black,
                            ),
                            hintText: 'weight : 0',
                          ),
                          controller: _ctrlWeight,
                        ),
                      ),
                      Text('กิโลกรัม\t\t\t'),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            icon: Icon(
                              FontAwesomeIcons.textHeight,
                              color: Colors.black,
                            ),
                            hintText: 'height : 0',
                          ),
                          controller: _ctrlHeight,
                        ),
                      ),
                      Text('เซนติเมตร'),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            icon: Icon(
                              Icons.person,
                              color: Colors.black,
                            ),
                            hintText: 'age : 0',
                          ),
                          controller: _ctrlage,
                        ),
                      ),
                      Text('ปี\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t'),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: RaisedButton(
                          onPressed: () {
                             setState(() {
                               if(_ctrlWeight.text.isEmpty == true){
                                 showDialog(
                                     barrierDismissible: false,
                                     context: context,
                                     builder: (context){
                                       return AlertDialog(
                                         shape: RoundedRectangleBorder(
                                           borderRadius: BorderRadius.circular(15.0),
                                         ),
                                         title: Text(
                                           'คําเตือน',
                                           textAlign: TextAlign.center,
                                           style: TextStyle(
                                             color: Colors.red,
                                             fontWeight: FontWeight.bold,
                                           ),
                                         ),
                                         content: Text(
                                           'น้ำหนักห้ามว่าง และห้ามเปฺ็น 0',
                                           textAlign: TextAlign.center,
                                         ),
                                         actions: <Widget>[
                                           RaisedButton(
                                             onPressed: (){
                                               Navigator.of(context).pop();
                                             },
                                             child: Text(
                                               'ตกลง',
                                               style: TextStyle(
                                                 color: Colors.white,
                                               ),
                                             ),
                                             color: Color(0xFF04cfcc),
                                           ),
                                         ],
                                       );
                                     }
                                 );
                               }
                               else if(_ctrlHeight.text.isEmpty == true){
                                 showDialog(
                                     barrierDismissible: false,
                                     context: context,
                                     builder: (context){
                                       return AlertDialog(
                                         shape: RoundedRectangleBorder(
                                           borderRadius: BorderRadius.circular(15.0),
                                         ),
                                         title: Text(
                                           'คําเตือน',
                                           textAlign: TextAlign.center,
                                           style: TextStyle(
                                             color: Colors.red,
                                             fontWeight: FontWeight.bold,
                                           ),
                                         ),
                                         content: Text(
                                           'ส่วนสูงห้ามว่าง และห้ามเปฺ็น 0',
                                           textAlign: TextAlign.center,
                                         ),
                                         actions: <Widget>[
                                           RaisedButton(
                                             onPressed: (){
                                               Navigator.of(context).pop();
                                             },
                                             child: Text(
                                               'ตกลง',
                                               style: TextStyle(
                                                 color: Colors.white,
                                               ),
                                             ),
                                             color: Color(0xFF04cfcc),
                                           ),
                                         ],
                                       );
                                     }
                                 );
                               }else if(_ctrlage.text.isEmpty == true){
                                 showDialog(
                                     barrierDismissible: false,
                                     context: context,
                                     builder: (context){
                                       return AlertDialog(
                                         shape: RoundedRectangleBorder(
                                           borderRadius: BorderRadius.circular(15.0),
                                         ),
                                         title: Text(
                                           'คําเตือน',
                                           textAlign: TextAlign.center,
                                           style: TextStyle(
                                             color: Colors.red,
                                             fontWeight: FontWeight.bold,
                                           ),
                                         ),
                                         content: Text(
                                           'อายุห้ามว่าง และห้ามเปฺ็น 0',
                                           textAlign: TextAlign.center,
                                         ),
                                         actions: <Widget>[
                                           RaisedButton(
                                             onPressed: (){
                                               Navigator.of(context).pop();
                                             },
                                             child: Text(
                                               'ตกลง',
                                               style: TextStyle(
                                                 color: Colors.white,
                                               ),
                                             ),
                                             color: Color(0xFF04cfcc),
                                           ),
                                         ],
                                       );
                                     }
                                 );
                               }else{
                                 double weight = double.parse(_ctrlWeight.text);
                                 double height = double.parse(_ctrlHeight.text);
                                 double age = double.parse(_ctrlage.text);

                                 if(_genderselect == 0){
                                   //C->F
                                   BMR = 66 + (13.7 * weight) + (5 * height) - (6.8 * age);
                                 }else{
                                   //F->C
                                   BMR = 655 + (19.6 * weight) + (1.8 * height) - (4.7 * age);
                                 }
                               }
                             });
                          },
                          child: Text(
                            'คำนวณ',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.0,
                            ),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              10.0,
                            ),
                          ),
                          color: Colors.blue,
                        ),
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      Expanded(
                        child: RaisedButton(
                          onPressed: () {
                            setState(() {
                              _ctrlWeight.clear();
                              _ctrlHeight.clear();
                              _ctrlage.clear();
                              BMR = 0.0;
                            });
                          },
                          child: Text(
                            'ยกเลิก',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.0,
                            ),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              10.0,
                            ),
                          ),
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Divider(
                    height: 5.0,
                    color: Colors.black,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    'อัตราการเผาผลาญพลังงาน',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                   _bmr = '${BMR.toString()}',
                    style: TextStyle(
                      fontSize:  20.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }
}
