import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'globals.dart' as globals;
import 'askregister.dart';
import 'package:Shrine/services/checklogin.dart';
import 'home.dart';
import 'package:Shrine/model/user.dart';
import 'services/services.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MyHomePage(title: 'Attendance');
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  TextEditingController _name,_cname,_email,_pass,_cont,_phone,_city;
  bool loader = false;
  bool _isButtonDisabled = false;
  final FocusNode __name = FocusNode();
  final FocusNode __cname = FocusNode();
  final FocusNode __email = FocusNode();
  final FocusNode __pass = FocusNode();
  final FocusNode __cont = FocusNode();
  final FocusNode __phone = FocusNode();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  SharedPreferences prefs;
  Map<String, dynamic>res;
  List<Map> _myJson = [{"id":"0","name":"Country"},{"id":"2","name":"Afghanistan"},{"id":"4","name":"Albania"},{"id":"50","name":"Algeria"},{"id":"5","name":"American Samoa"},{"id":"6","name":"Andorra"},{"id":"7","name":"Angola"},{"id":"11","name":"Anguilla"},{"id":"3","name":"Antigua and Barbuda"},{"id":"160","name":"Argentina"},{"id":"8","name":"Armenia"},{"id":"9","name":"Aruba"},{"id":"10","name":"Australia"},{"id":"1","name":"Austria"},{"id":"12","name":"Azerbaijan"},{"id":"27","name":"Bahamas"},{"id":"25","name":"Bahrain"},{"id":"14","name":"Bangladesh"},{"id":"15","name":"Barbados"},{"id":"29","name":"Belarus"},{"id":"13","name":"Belgium"},{"id":"30","name":"Belize"},{"id":"16","name":"Benin"},{"id":"17","name":"Bermuda"},{"id":"20","name":"Bhutan"},{"id":"23","name":"Bolivia"},{"id":"22","name":"Bosnia and Herzegovina"},{"id":"161","name":"Botswana"},{"id":"24","name":"Brazil"},{"id":"28","name":"British Virgin Islands"},{"id":"26","name":"Brunei"},{"id":"19","name":"Bulgaria"},{"id":"18","name":"Burkina Faso"},{"id":"21","name":"Burundi"},{"id":"101","name":"Cambodia"},{"id":"32","name":"Cameroon"},{"id":"34","name":"Canada"},{"id":"43","name":"Cape Verde"},{"id":"33","name":"Cayman Islands"},{"id":"163","name":"Central African Republic"},{"id":"203","name":"Chad"},{"id":"165","name":"Chile"},{"id":"205","name":"China"},{"id":"233","name":"Christmas Island"},{"id":"39","name":"Cocos Islands"},{"id":"38","name":"Colombia"},{"id":"40","name":"Comoros"},{"id":"41","name":"Cook Islands"},{"id":"42","name":"Costa Rica"},{"id":"36","name":"Cote dIvoire"},{"id":"90","name":"Croatia"},{"id":"31","name":"Cuba"},{"id":"44","name":"Cyprus"},{"id":"45","name":"Czech Republic"},{"id":"48","name":"Denmark"},{"id":"47","name":"Djibouti"},{"id":"226","name":"Dominica"},{"id":"49","name":"Dominican Republic"},{"id":"55","name":"Ecuador"},{"id":"58","name":"Egypt"},{"id":"57","name":"El Salvador"},{"id":"80","name":"Equatorial Guinea"},{"id":"56","name":"Eritrea"},{"id":"60","name":"Estonia"},{"id":"59","name":"Ethiopia"},{"id":"62","name":"Falkland Islands"},{"id":"63","name":"Faroe Islands"},{"id":"65","name":"Fiji"},{"id":"186","name":"Finland"},{"id":"61","name":"France"},{"id":"64","name":"French Guiana"},{"id":"67","name":"French Polynesia"},{"id":"69","name":"Gabon"},{"id":"223","name":"Gambia"},{"id":"70","name":"Gaza Strip"},{"id":"77","name":"Georgia"},{"id":"46","name":"Germany"},{"id":"78","name":"Ghana"},{"id":"75","name":"Gibraltar"},{"id":"81","name":"Greece"},{"id":"82","name":"Greenland"},{"id":"228","name":"Grenada"},{"id":"83","name":"Guadeloupe"},{"id":"84","name":"Guam"},{"id":"76","name":"Guatemala"},{"id":"72","name":"Guernsey"},{"id":"167","name":"Guinea"},{"id":"79","name":"Guinea-Bissau"},{"id":"85","name":"Guyana"},{"id":"168","name":"Haiti"},{"id":"218","name":"Holy See"},{"id":"87","name":"Honduras"},{"id":"89","name":"Hong Kong"},{"id":"86","name":"Hungary"},{"id":"97","name":"Iceland"},{"id":"93","name":"India"},{"id":"169","name":"Indonesia"},{"id":"94","name":"Iran"},{"id":"96","name":"Iraq"},{"id":"95","name":"Ireland"},{"id":"74","name":"Isle of Man"},{"id":"92","name":"Israel"},{"id":"91","name":"Italy"},{"id":"99","name":"Jamaica"},{"id":"98","name":"Japan"},{"id":"73","name":"Jersey"},{"id":"100","name":"Jordan"},{"id":"102","name":"Kazakhstan"},{"id":"52","name":"Kenya"},{"id":"104","name":"Kiribati"},{"id":"106","name":"Kosovo"},{"id":"107","name":"Kuwait"},{"id":"103","name":"Kyrgyzstan"},{"id":"109","name":"Laos"},{"id":"114","name":"Latvia"},{"id":"171","name":"Lebanon"},{"id":"112","name":"Lesotho"},{"id":"111","name":"Liberia"},{"id":"110","name":"Libya"},{"id":"66","name":"Liechtenstein"},{"id":"113","name":"Lithuania"},{"id":"108","name":"Luxembourg"},{"id":"117","name":"Macau"},{"id":"125","name":"Macedonia"},{"id":"172","name":"Madagascar"},{"id":"132","name":"Malawi"},{"id":"118","name":"Malaysia"},{"id":"131","name":"Maldives"},{"id":"173","name":"Mali"},{"id":"115","name":"Malta"},{"id":"124","name":"Marshall Islands"},{"id":"119","name":"Martinique"},{"id":"170","name":"Mauritania"},{"id":"130","name":"Mauritius"},{"id":"120","name":"Mayotte"},{"id":"123","name":"Mexico"},{"id":"68","name":"Micronesia"},{"id":"122","name":"Moldova"},{"id":"121","name":"Monaco"},{"id":"127","name":"Mongolia"},{"id":"126","name":"Montenegro"},{"id":"128","name":"Montserrat"},{"id":"116","name":"Morocco"},{"id":"129","name":"Mozambique"},{"id":"133","name":"Myanmar"},{"id":"136","name":"Namibia"},{"id":"137","name":"Nauru"},{"id":"139","name":"Nepal"},{"id":"142","name":"Netherlands"},{"id":"135","name":"Netherlands Antilles"},{"id":"138","name":"New Caledonia"},{"id":"146","name":"New Zealand"},{"id":"140","name":"Nicaragua"},{"id":"174","name":"Niger"},{"id":"225","name":"Nigeria"},{"id":"141","name":"Niue"},{"id":"145","name":"Norfolk Island"},{"id":"144","name":"North Korea"},{"id":"143","name":"Northern Mariana Islands"},{"id":"134","name":"Norway"},{"id":"147","name":"Oman"},{"id":"153","name":"Pakistan"},{"id":"150","name":"Palau"},{"id":"149","name":"Panama"},{"id":"155","name":"Papua New Guinea"},{"id":"157","name":"Paraguay"},{"id":"151","name":"Peru"},{"id":"178","name":"Philippines"},{"id":"152","name":"Pitcairn Islands"},{"id":"154","name":"Poland"},{"id":"148","name":"Portugal"},{"id":"156","name":"Puerto Rico"},{"id":"158","name":"Qatar"},{"id":"164","name":"Republic of the Congo"},{"id":"166","name":"Reunion"},{"id":"175","name":"Romania"},{"id":"159","name":"Russia"},{"id":"182","name":"Rwanda"},{"id":"88","name":"Saint Helena"},{"id":"105","name":"Saint Kitts and Nevis"},{"id":"229","name":"Saint Lucia"},{"id":"191","name":"Saint Martin"},{"id":"195","name":"Saint Pierre and Miquelon"},{"id":"232","name":"Saint Vincent and the Grenadines"},{"id":"230","name":"Samoa"},{"id":"180","name":"San Marino"},{"id":"197","name":"Sao Tome and Principe"},{"id":"184","name":"Saudi Arabia"},{"id":"193","name":"Senegal"},{"id":"196","name":"Serbia"},{"id":"200","name":"Seychelles"},{"id":"224","name":"Sierra Leone"},{"id":"187","name":"Singapore"},{"id":"188","name":"Slovakia"},{"id":"190","name":"Slovenia"},{"id":"189","name":"Solomon Islands"},{"id":"194","name":"Somalia"},{"id":"179","name":"South Africa"},{"id":"176","name":"South Korea"},{"id":"51","name":"Spain"},{"id":"37","name":"Sri Lanka"},{"id":"198","name":"Sudan"},{"id":"192","name":"Suriname"},{"id":"199","name":"Svalbard"},{"id":"185","name":"Swaziland"},{"id":"183","name":"Sweden"},{"id":"35","name":"Switzerland"},{"id":"201","name":"Syria"},{"id":"162","name":"Taiwan"},{"id":"202","name":"Tajikistan"},{"id":"53","name":"Tanzania"},{"id":"204","name":"Thailand"},{"id":"206","name":"Timor-Leste"},{"id":"181","name":"Togo"},{"id":"209","name":"Tonga"},{"id":"211","name":"Trinidad and Tobago"},{"id":"208","name":"Tunisia"},{"id":"210","name":"Turkey"},{"id":"207","name":"Turkmenistan"},{"id":"212","name":"Turks and Caicos Islands"},{"id":"213","name":"Tuvalu"},{"id":"219","name":"U.S. Virgin Islands"},{"id":"54","name":"Uganda"},{"id":"214","name":"Ukraine"},{"id":"215","name":"United Arab Emirates"},{"id":"71","name":"United Kingdom"},{"id":"216","name":"United States"},{"id":"177","name":"Uruguay"},{"id":"217","name":"Uzbekistan"},{"id":"221","name":"Vanuatu"},{"id":"235","name":"Venezuela"},{"id":"220","name":"Vietnam"},{"id":"222","name":"Wallis and Futuna"},{"id":"227","name":"West Bank"},{"id":"231","name":"Western Sahara"},{"id":"234","name":"Yemen"},{"id":"237","name":"Zaire"},{"id":"236","name":"Zambia"},{"id":"238","name":"Zimbabwe"}];
  String _country;
  bool _obscureText = true;
  @override
  void initState() {
    _name = new TextEditingController();
    _cname = new TextEditingController();
    _email = new TextEditingController();
    _phone = new TextEditingController();
    _pass = new TextEditingController();
    _cont = new TextEditingController();
    _city = new TextEditingController();
    super.initState();
  }
  setLocal(var fname, var empid, var  orgid) async {
    prefs = await SharedPreferences.getInstance();
    await prefs.setString('fname',fname);
    await prefs.setString('empid',empid);
    await prefs.setString('orgid',orgid);
  }
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              new Text("Attendance", style: new TextStyle(fontSize: 20.0)),
            ],
          ),
          leading: IconButton(icon:Icon(Icons.arrow_back),onPressed:(){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AskRegisterationPage()),
            );
          },),
          backgroundColor: Colors.teal,
        ),
      body: new SafeArea(
          top: false,
          bottom: false,
          child: loader ? runloader():new Form(
              key: _formKey,
              autovalidate: true,

              child: new ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                children: <Widget>[
                  new Text('Register Your Company',
                    textAlign: TextAlign.center,
                    style: new TextStyle(fontWeight: FontWeight.bold, fontSize:20.0, color: Colors.teal ),
                  ),
                  new TextFormField(
                    /*   validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter company name';
                      }
                    },*/
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.business),
                      hintText: 'Company',
                      labelText: 'Company',
                    ),
                    controller: _name,
                    focusNode: __name,
                  ),
                  new TextFormField(
                    /*  validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter contact person name';
                      }
                    },*/
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.person),
                      hintText: 'Contact Person',
                      labelText: 'Contact Person',
                    ),
                    controller: _cname,
                    focusNode: __cname,
                  ),
                  new TextFormField(
                    /*    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter valid email';
                      }
                    },*/
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.email),
                      hintText: 'Email',
                      labelText: 'Email',
                    ),
                    //obscureText: true,
                    controller: _email,
                    focusNode: __email,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  new Row(
                    children: <Widget>[
                      new Expanded(
                        child:  new TextFormField(
                          decoration: const InputDecoration(
                              labelText: 'Password',
                              icon: const Padding(
                                  padding: const EdgeInsets.only(top: 15.0),
                                  child: const Icon(Icons.lock))),
                          /*        validator: (val) => val.length < 6 ? 'Password too short.' : null,
                          onSaved: (val) => _password = val,*/
                          obscureText: _obscureText,
                          controller: _pass,
                          focusNode: __pass,
                        ),

                      ),
                      new FlatButton(
                        padding: EdgeInsets.all(0.0),
                        onPressed: _toggle,
                        child: Row(
                          children: <Widget>[
                            Icon(_obscureText ?Icons.visibility:Icons.visibility_off),
                          ],
                        ),
                      ),
                      // child: new Text(_obscureText ? "show": "Hide")),

                    ],
                  ),
                  new InputDecorator(
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.satellite),
                      labelText: 'Country',
                    ),
                    //   isEmpty: _color == '',
                    child:  new DropdownButton<String>(
                      isDense: true,
                      //    hint: new Text("Select"),
                      value: _country,
                      onChanged: (String newValue) {
                        setState(() {
                          _country = newValue;
                        });
                      },
                      items: _myJson.map((Map map) {
                        return new DropdownMenuItem<String>(
                          value: map["id"].toString(),
                          child: new Text(
                            map["name"],
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  new TextFormField(
                    /*    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter Phone';
                      }
                    },*/
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.phone),
                      hintText: 'Phone',
                      labelText: 'Phone',
                    ),
                    controller: _phone,
                    focusNode: __phone,
                    keyboardType: TextInputType.phone,
                    inputFormatters: [
                      WhitelistingTextInputFormatter.digitsOnly,
                    ],
                  ),

                  new TextFormField(
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.location_city),
                      hintText: 'City(optional)',
                      labelText: 'City',
                    ),
                    controller: _city,
                    keyboardType: TextInputType.text,
                  ),

                  new Container(
                      padding: const EdgeInsets.only(left: 0.0, top: 20.0),
                      child: _isButtonDisabled?new RaisedButton(
                      color: Colors.orange,
                      textColor: Colors.white,
                      padding: EdgeInsets.all(20.0),
                      child: const Text('Please wait...',style: TextStyle(fontSize: 18.0),),
                      onPressed: (){}
                      ):new RaisedButton(
                        color: Colors.orange,
                        textColor: Colors.white,
                        padding: EdgeInsets.all(20.0),
                        child: const Text('Register Company',style: TextStyle(fontSize: 18.0),),
                        onPressed: (){

/*
                          setLocal('Ubitech Solutions','0','0');
                          showDialog(context: context, child:
                          new AlertDialog(
                            title: new Text("Congratulations"),
                            content: new Text(prefs.getString('fname')),
                            actions: <Widget>[
                              new RaisedButton(
                                color: Colors.green,
                                textColor: Colors.white,
                                child: new Text('Start Trial'),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          ));
                          print('============*******************===============');
                          return;
*/
                          if(_isButtonDisabled)
                            return null;

                          if(_name.text=='') {
                            showDialog(context: context, child:
                            new AlertDialog(
                              title: new Text("Alert"),
                              content: new Text("Please enter company name"),
                            ));
                            FocusScope.of(context).requestFocus(__name);
                          }
                          else if(_cname.text=='') {
                            showDialog(context: context, child:
                            new AlertDialog(
                              title: new Text("Alert"),
                              content: new Text("Please enter contact person name"),
                            ));
                            FocusScope.of(context).requestFocus(__cname);
                          }
                          /*else if(_email.text=='') {
                            showDialog(context: context, child:
                            new AlertDialog(
                              title: new Text("Alert"),
                              content: new Text("Please enter valid email"),
                            ));
                            FocusScope.of(context).requestFocus(__email);
                          }*/
                          else if(!(validateEmail(_email.text))) {
                            //print((validateEmail(_email.text)).toString());

                            showDialog(context: context, child:
                            new AlertDialog(
                              title: new Text("Alert"),
                              content: new Text("Please enter valid email"),
                            ));
                            FocusScope.of(context).requestFocus(__email);
                            return null;

                          }
                          else if(_pass.text.length<6) {
                            showDialog(context: context, child:
                            new AlertDialog(
                              title: new Text("Alert"),
                              content: new Text("Please enter valid password \n (password must contains at least 6 character)"),
                            ));
                            FocusScope.of(context).requestFocus(__pass);
                          }
                          else if(_country=='0') {
                            showDialog(context: context, child:
                            new AlertDialog(
                              title: new Text("Alert"),
                              content: new Text("Please enter valid phone"),
                            ));
                            FocusScope.of(context).requestFocus(__phone);
                          }
                          else if(_phone.text.length<6) {
                            showDialog(context: context, child:
                            new AlertDialog(
                              title: new Text("Alert"),
                              content: new Text("Please enter valid phone"),
                            ));
                            FocusScope.of(context).requestFocus(__phone);
                          }
                          else {
                            setState(() {
                              _isButtonDisabled=true;

                            });
                            var url = globals.path+"register_org";
                            http.post(url, body: {
                              "org_name": _name.text,
                              "name": _cname.text,
                              "phone": _phone.text,
                              "email": _email.text,
                              "password": _pass.text,
                              "country": _country,
                              "countrycode": '',
                              "address": _city.text
                            }) .then((response) {
                              if (response.statusCode == 200) {

                                print("-----------------> After Registration ---------------->");
                                print(response.body.toString());
                                res = json.decode(response.body);
                                if (res['sts'] == 'true') {
                                  setLocal(res['f_name'],res['id'],res['org_id']);

                                  showDialog(context: context, child:
                                  new AlertDialog(
                                    title: new Text("ubiAttendance"),
                                    content: new Text("Hi " + res['f_name'] +
                                        " \n Your company has been registered successfully."),
                                    actions: <Widget>[
                                      new RaisedButton(
                                        color: Colors.green,
                                        textColor: Colors.white,
                                        child: new Text('Start Trial'),
                                        onPressed: () {
                                          Navigator.of(context, rootNavigator: true).pop();
                                          login(_phone.text, _pass.text, context);
                                        },
                                      ),
                                    ],
                                  ));

                                } else if (res['sts'] == 'false1' ||
                                    res['sts'] == 'false3') {
                                  showDialog(context: context, child:
                                  new AlertDialog(
                                    title: new Text("ubiAttendance"),
                                    content: new Text(
                                        "Email id is already registered"),
                                  ));
                                } else if (res['sts'] == 'false2' ||
                                    res['sts'] == 'false4') {
                                  showDialog(context: context, child:
                                  new AlertDialog(
                                    title: new Text("ubiAttendance"),
                                    content: new Text(
                                        "Phone id is already registered"),
                                  ));
                                } else {
                                  showDialog(context: context, child:
                                  new AlertDialog(
                                    title: new Text("ubiAttendance"),
                                    content: new Text(
                                        "Oops!! Company not registered \n Try later"),
                                  ));
                                }
                                setState(() {
                                  _isButtonDisabled=false;

                                });
                              } else {
                                setState(() {
                                  _isButtonDisabled=false;

                                });
                                showDialog(context: context, child:
                                new AlertDialog(
                                  title: new Text("Error"),
                                  // content: new Text("Unable to call service"),
                                  content: new Text("Response status: ${response
                                      .statusCode} \n Response body: ${response
                                      .body}"),
                                )
                                );

                              }
                              //   print("Response status: ${response.statusCode}");
                              //   print("Response body: ${response.body}");
                            }).catchError((onError) {
                              setState(() {
                                _isButtonDisabled=false;
                              });
                              showDialog(context: context, child:
                              new AlertDialog(
                                title: new Text("Error"),
                                content: new Text("Too slow internet"),
                              )
                              );
                            });
                          }
                          // return false;

                        },
                      )),
                ],
              ))),
    );

  }

  login(var username,var userpassword, BuildContext context) async{
    var user = User(username,userpassword);
    Login dologin = Login();
    setState(() {
      loader = true;
    });
    var islogin = await dologin.checkLogin(user);
    print(islogin);
    if(islogin=="success"){
      /*Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );*/
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => HomePage()), (Route<dynamic> route) => false,
      );
    }else if(islogin=="failure"){
      setState(() {
        loader = false;
      });
      Scaffold.of(context)
          .showSnackBar(
          SnackBar(content: Text("Invalid login credentials")));
    }else{
      setState(() {
        loader = false;
      });
      Scaffold.of(context)
          .showSnackBar(
          SnackBar(content: Text("Poor network connection.")));
    }
  }


  runloader(){
    return new Container(
      child: Center(
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Image.asset(
                  'assets/spinner.gif', height: 50.0, width: 50.0),
            ]),
      ),
    );
  }

}