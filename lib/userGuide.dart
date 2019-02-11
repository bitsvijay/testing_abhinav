import 'package:flutter/material.dart';
import 'package:flutter_html_view/flutter_html_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'drawer.dart';
import 'home.dart';
void main() => runApp(new UserGuide());

class UserGuide extends StatefulWidget {
  @override
  _UserGuide createState() => _UserGuide();
}

class _UserGuide extends State<UserGuide> {
  String fname="";
  String lname="";
  String desination="";
  String profile="";
  String org_name="";
  double _animatedHeight_markatt = 0.0;
  double _animatedHeight_reqtimeoff = 0.0;
  double _animatedHeight_attlog = 0.0;
  double _animatedHeight_visitlog = 0.0;
  double _animatedHeight_chngpwd = 0.0;
  double _animatedHeight_editprofile = 0.0;
  double _animatedHeight_attreport = 0.0;
  double _animatedHeight_configure = 0.0;
  double _animatedHeight_addemp = 0.0;
  double _animatedHeight_checktimeoff = 0.0;
  double _animatedHeight_empvisit = 0.0;

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }
  // Platform messages are asynchronous, so we initialize in an async method.
  initPlatformState() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      fname = prefs.getString('fname') ?? '';
      lname = prefs.getString('lname') ?? '';
      desination = prefs.getString('desination') ?? '';
      profile = prefs.getString('profile') ?? '';
      org_name = prefs.getString('org_name') ?? '';
     // _animatedHeight = 0.0;
    });
  }
  @override
  Widget build(BuildContext context) {

    return new Scaffold(
        appBar: new AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              new Text(org_name, style: new TextStyle(fontSize: 20.0)),
            ],
          ),
          leading: IconButton(icon:Icon(Icons.arrow_back),onPressed:(){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },),
          backgroundColor: Colors.teal,
        ),
        endDrawer: new AppDrawer(),
        body: userWidget()
    );
  }

  userWidget(){

    return Container(
      margin: const EdgeInsets.all(10.0),
      width:  MediaQuery.of(context).size.width * 1,
      child:ListView(
          //crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[

          Center(
            child:Text('Explore Attendance App',
              style: new TextStyle(fontSize: 25.0, color: Colors.orangeAccent, fontWeight: FontWeight.bold)),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.01,),


        Image.asset(
                'assets/mark_attendance.png',fit: BoxFit.fill,
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
        GestureDetector(
          onTap: ()=>setState((){
            _animatedHeight_markatt==0.0?_animatedHeight_markatt=MediaQuery.of(context).size.height * 0.25:_animatedHeight_markatt=0.0;}),
        child:Text('How to mark Attendance?',style: TextStyle(fontSize: 20.0,color: Colors.blue)),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.015,),
        new AnimatedContainer(duration: const Duration(milliseconds: 5),
          child:SizedBox(
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("1. Click on \"Time In\" button"),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.005,),
                      Text("2. Your current location will be shown. If it is incorrect then press the refresh location link to fetch the location"),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.005,),
                      Text("3. Capture image by using your phone’s camera and click on “Save” button."),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.005,),
                      Text("4. Time In will be marked successfully."),
                     // SizedBox(height: 5.0,),
                    ],
                  )
              ),


          height: _animatedHeight_markatt,

        ),
        SizedBox(height: 30.0,),
        /******************************* Request Timeoff*************************************/
        Image.asset(
          'assets/reqtimeoff.png',fit: BoxFit.fill,
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
        GestureDetector(
          onTap: ()=>setState((){
          _animatedHeight_reqtimeoff==0.0?_animatedHeight_reqtimeoff=MediaQuery.of(context).size.height * 0.30:_animatedHeight_reqtimeoff=0.0;}),
          child:Text('How to request Time off?',style: TextStyle(fontSize: 20.0,color: Colors.blue)),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.015,),
        new AnimatedContainer(duration: const Duration(milliseconds: 5),
          child:SizedBox(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Request Time Off",style: TextStyle(fontWeight: FontWeight.bold),),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.005,),
                  Text("    1. Click on \"Add\" button"),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.005,),
                  Text("    2. Fill the time off request form"),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.005,),
                  Text("    3. Click on \"Save\" button"),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.010,),
                  Text("To check your Time off History.",style: TextStyle(fontWeight: FontWeight.bold),),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.005,),
                  Text("    1. Click on “Time Off” button from Home screen"),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.005,),
                  Text("    2. Your Time off history will be displayed"),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.005,),
                  Text("    3. You can also check status of your time off request"),
                ],
              )
          ),


          height: _animatedHeight_reqtimeoff,

        ),
        SizedBox(height: 30.0,),
        /******************************* How to view your attendnce log*************************************/
        Image.asset(
          'assets/att_log.png',fit: BoxFit.fill,
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
        GestureDetector(
          onTap: ()=>setState((){
            _animatedHeight_attlog==0.0?_animatedHeight_attlog=MediaQuery.of(context).size.height * 0.18:_animatedHeight_attlog=0.0;}),
          child:Text('How to view your Attendance Log?',style: TextStyle(fontSize: 20.0,color: Colors.blue)),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.015,),
        new AnimatedContainer(duration: const Duration(milliseconds: 5),
          child:SizedBox(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Click on “Log” on Home screen to check your last 7 days attendance which includes:",style: TextStyle(fontWeight: FontWeight.bold),),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.005,),
                  Text("    1. Captured Time In / Time Out photo."),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.005,),
                  Text("    2. Tracked Time In / Time Out location"),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.005,),
                  Text("    3. Recorded Time In / Time Out time"),
                ],
              )
          ),


          height: _animatedHeight_attlog,

        ),
        SizedBox(height: 30.0,),
        /******************************* How to view Visits Log*************************************/
        Image.asset(
          'assets/visitlog.png',fit: BoxFit.fill,
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
        GestureDetector(
          onTap: ()=>setState((){
            _animatedHeight_visitlog==0.0?_animatedHeight_visitlog=MediaQuery.of(context).size.height * 0.35:_animatedHeight_visitlog=0.0;}),
          child:Text('How to view Visits Log?',style: TextStyle(fontSize: 20.0,color: Colors.blue)),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.015,),
        new AnimatedContainer(duration: const Duration(milliseconds: 5),
          child:SizedBox(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                Text("The punch Visit feature is used for on field employees - those who visit clients/ sites / offices",style: TextStyle(fontWeight: FontWeight.bold),),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.005,),
                  Text("    1. The field employees should ensure that the GPS is turned on"),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.005,),
                  Text("    2. The employee will click on “Visits” from Home screen"),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.005,),
                  Text("    3. Click “Add” button"),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.005,),
                  Text("    4. To Punch your time click “Visit In” & fill details about the visit"),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.005,),
                  Text("    5. To punch your visit out time click “Visit out”"),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.005,),
                  Text("    6. You Will be redirected to your “Today’s Visits Screen”"),
                ],
              )
          ),


          height: _animatedHeight_visitlog,

        ),
        SizedBox(height: 30.0,),
        /******************************* How to change Password*************************************/
        Image.asset(
          'assets/changepwd.png',fit: BoxFit.fill,
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
        GestureDetector(
          onTap: ()=>setState((){
            _animatedHeight_chngpwd==0.0?_animatedHeight_chngpwd=MediaQuery.of(context).size.height * 0.18:_animatedHeight_chngpwd=0.0;}),
          child:Text('How to change Password?',style: TextStyle(fontSize: 20.0,color: Colors.blue)),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.015,),
        new AnimatedContainer(duration: const Duration(milliseconds: 5),
          child:SizedBox(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("    1. Click on “Settings”"),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.005,),
                  Text("    2. Go to “change password”"),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.005,),
                  Text("    3. Enter your old password then enter new password"),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.005,),
                  Text("    4. Click on “save”"),
                ],
              )
          ),


          height: _animatedHeight_chngpwd,

        ),
        SizedBox(height: 30.0,),
        /******************************* How to edit your Profile*************************************/
        Image.asset(
          'assets/editprofile.png',fit: BoxFit.fill,
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
        GestureDetector(
          onTap: ()=>setState((){
            _animatedHeight_editprofile==0.0?_animatedHeight_editprofile=MediaQuery.of(context).size.height * 0.18:_animatedHeight_editprofile=0.0;}),
          child:Text('How to edit your Profile?',style: TextStyle(fontSize: 20.0,color: Colors.blue)),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.015,),
        new AnimatedContainer(duration: const Duration(milliseconds: 5),
          child:SizedBox(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("    1. Click on “Settings”"),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.005,),
                  Text("    2. Go to the “Profile” section"),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.005,),
                  Text("    3. You can only update your Phone no. &    Photo"),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.005,),
                  Text("    4. Click on “save” once completed."),
                ],
              )
          ),


          height: _animatedHeight_editprofile,

        ),
        SizedBox(height: 30.0,),

          Text('Explore ubiAttendance (Admin)',style: TextStyle(fontSize: 25.0,color: Colors.orangeAccent, fontWeight: FontWeight.bold)),
          SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
        /******************************* How to check Attendance Reports***********************************/
        Image.asset(
          'assets/attreport.png',fit: BoxFit.fill,
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
        GestureDetector(
          onTap: ()=>setState((){
            _animatedHeight_attreport==0.0?_animatedHeight_attreport=MediaQuery.of(context).size.height * 0.30:_animatedHeight_attreport=0.0;}),
          child:Text('How to check Attendance Reports?',style: TextStyle(fontSize: 20.0,color: Colors.blue)),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.015,),
        new AnimatedContainer(duration: const Duration(milliseconds: 5),
          child:SizedBox(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("    1. Today’s Attendance"),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.005,),
                  Text("    2. Late Comers"),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.005,),
                  Text("    3. Early Leavers"),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.005,),
                  Text("    4. Time Off"),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.005,),
                  Text("    5. Punched Visits"),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.005,),
                  Text("    6. Yesterday’s Attendance"),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.005,),
                  Text("    7. Last 7 days Attendance"),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.005,),
                  Text("    8. Current Month"),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.005,),
                  Text("    9. Attendance by Date"),
                ],
              )
          ),


          height: _animatedHeight_attreport,

        ),
        SizedBox(height: 30.0,),
        /******************************* How to configure Shifts, Designations & Department***********************************/
        Image.asset(
          'assets/config.png',fit: BoxFit.fill,
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
        GestureDetector(
          onTap: ()=>setState((){
            _animatedHeight_configure==0.0?_animatedHeight_configure=MediaQuery.of(context).size.height * 0.35:_animatedHeight_configure=0.0;}),
          child:Text('How to configure Shifts, Designations & Department?',style: TextStyle(fontSize: 20.0,color: Colors.blue)),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.015,),
        new AnimatedContainer(duration: const Duration(milliseconds: 5),
          child:SizedBox(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[

              Text("Admin can configure Shifts, Departments and Designations through the “Settings”",style: TextStyle(fontWeight: FontWeight.bold),),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.005,),
                  Text("    1. Click on “Shifts” to manage shifts and add shifts"),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.005,),
                  Text("    2. Click on “Departments” to manage departments and add new departments"),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.005,),
                  Text("    3. Click on “Designations” to manage currently added designations and add new designations"),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.005,),
                  Text("    4. Click on “Employees” to add employees and manage currently added employees"),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.005,),
                  Text("    5. “Change Password” is to update your passwords"),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.005,),
                  Text("    6. “Profile” option is to edit/view your profile"),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.005,),
                  Text("Your system will be fully configured now."),
                ],
              )
          ),


          height: _animatedHeight_configure,

        ),
        SizedBox(height: 30.0,),
        /******************************* How to add an Employee***********************************/
        Image.asset(
          'assets/addemp.png',fit: BoxFit.fill,
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
        GestureDetector(
          onTap: ()=>setState((){
            _animatedHeight_addemp==0.0?_animatedHeight_addemp=MediaQuery.of(context).size.height * 0.40:_animatedHeight_addemp=0.0;}),
          child:Text('How to add an Employee?',style: TextStyle(fontSize: 20.0,color: Colors.blue)),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.015,),
        new AnimatedContainer(duration: const Duration(milliseconds: 5),
          child:SizedBox(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Going with the admin login, first go to “Settings” and click on “Employees” to register employee",style: TextStyle(fontWeight: FontWeight.bold),),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.005,),
                  Text("    1. Enter First Name & Last Name"),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.005,),
                  Text("    2. Enter employee’s Email (optional)"),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.005,),
                  Text("    3. Select a Country from dropdown"),
                  Text("    (Country code will automatically get selected)"),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.005,),
                  Text("    4. Enter employee’s Mobile Number"),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.005,),
                  Text("    5. Enter Password (at least 6 characters long)"),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.005,),
                  Text("    6. Re-enter Password to confirm"),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.005,),
                  Text("    7. Select Shift, Designation and  Department for the employee"),
            SizedBox(height: MediaQuery.of(context).size.height * 0.005,),
            Text("Click on “Register” button & the employee will be registered successfully."),

                ],
              )
          ),


          height: _animatedHeight_addemp,

        ),
        SizedBox(height: 30.0,),
        /******************************* How to check Time off Log ***********************************/
        Image.asset(
          'assets/timeofflog.png',fit: BoxFit.fill,
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
        GestureDetector(
          onTap: ()=>setState((){
            _animatedHeight_checktimeoff==0.0?_animatedHeight_checktimeoff=MediaQuery.of(context).size.height * 0.18:_animatedHeight_checktimeoff=0.0;}),
          child:Text('How to check Time off Log?',style: TextStyle(fontSize: 20.0,color: Colors.blue)),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.015,),
        new AnimatedContainer(duration: const Duration(milliseconds: 5),
          child:SizedBox(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                Text("Admin can view time off requests of each employee",style: TextStyle(fontWeight: FontWeight.bold),),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.005,),
                  Text("    1. Go to “Reports”"),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.005,),
                  Text("    2. Click on “Time Off” to employee time off list."),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.005,),
                  Text("    3. Check employee time off with custom date"),
                ],
              )
          ),


          height: _animatedHeight_checktimeoff,

        ),
        SizedBox(height: 30.0,),
        /******************************* How to check Employee Visits***********************************/
        Image.asset(
          'assets/empvisit.png',fit: BoxFit.fill,
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
        GestureDetector(
          onTap: ()=>setState((){
            _animatedHeight_empvisit==0.0?_animatedHeight_empvisit=MediaQuery.of(context).size.height * 0.35:_animatedHeight_empvisit=0.0;}),
          child:Text('How to check Employee Visits?',style: TextStyle(fontSize: 20.0,color: Colors.blue)),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.015,),
        new AnimatedContainer(duration: const Duration(milliseconds: 5),

          child:SizedBox(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                Text("The punch Visit feature is used for on field employees - those who visit clients/ sites / offices",style: TextStyle(fontWeight: FontWeight.bold),),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.005,),
                  Text("    1. The field employees should ensure that the GPS is turned on"),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.005,),
                  Text("    2. The employee will click on “Visits” from Home screen"),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.005,),
                  Text("    3. Click “Add” button"),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.005,),
                  Text("    4. To Punch your time click “Visit In” & fill details about the visit"),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.005,),
                  Text("    5. To punch your visit out time click “Visit out”"),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.005,),
                  Text("    6. You Will be redirected to your “Today’s Visits Screen”"),
                ],
              )
          ),


          height: _animatedHeight_empvisit,

        )
        ]
      )
    );
  }
}