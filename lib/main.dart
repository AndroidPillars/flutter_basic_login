import 'package:flutter/material.dart';
import 'package:flutter_basic_login/dashboard_screen.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: MyApp(),
));

class MyApp extends StatefulWidget {
  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyApp> {
//Initializing the Global unique identifier for Widget
  final formKey = GlobalKey<FormState>();
//Initializing the Global unique identifier for SnackBar
  final scaffoldKey = GlobalKey<ScaffoldState>();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: Scaffold(
          key: scaffoldKey,
          body: Container(
            //Takes the full width of the screen
            width: double.infinity,
            //Setting the padding
            padding: EdgeInsets.all(50.0),
            //Designing the body
            decoration: BoxDecoration(
                //Setting the background color as gradient
                gradient: LinearGradient(
                    //Begin the gradient color from top left
                    begin: Alignment.topLeft,
                    //End the gradient color from bottom right
                    end: Alignment.bottomRight,
                    //It will stopd the gradient color in the screen at the values
                    stops: [
                  0.2,
                  0.4,
                  0.6,
                  0.8
                ],
                    //Setting the gradient color with values
                    colors: [
                  Colors.white,
                  Colors.white,
                  Colors.white,
                  Colors.white]

                  // Colors.red[200],
                  // Colors.red[400],
                  // Colors.red[600],
                  // Colors.red[800]
                )),
            child: Center(
              child: ListView(
                shrinkWrap: true,
                children: <Widget>[
                  Image.asset('assets/img_logo.png'),
                  SizedBox(
                    height: 10.0,
                  ),
                  //Form widget
                  Form(
                    //unique identifier for widget
                    key: formKey,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          //Function for validation
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please Enter the Email Id';
                            } else if (value.length < 5) {
                              return 'Please Enter the Valid Email Id';
                            }else if (!isEmail(value)) {
                              return 'Please Enter the Valid Email Id';
                            }
                          },
                          //input-type
                          keyboardType: TextInputType.emailAddress,
                          //auto-correct
                          autocorrect: false,
                          //input-action
                          textInputAction: TextInputAction.next,
                          //input-action
                          textCapitalization: TextCapitalization.sentences,
                          //alignment
                          textAlign: TextAlign.left,
                          //auto-focus
                          autofocus: false,
                          //style
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w300),
                          //cursor
                          cursorColor: Colors.white,
                          //cursorRadius: Radius.elliptical(0, 0),
                          cursorWidth: 2.0,
                          //character-length
                          maxLength: 140,
                          //Lines
                          maxLines: 1,
                          //password
                          decoration: InputDecoration(
                              //label
                              labelText: 'Email',
                              //icon-inside-label
                              prefixIcon:
                                  Icon(Icons.email, color: Colors.red),
                              contentPadding:
                                  EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                              //outline-border
                              border: OutlineInputBorder()),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        TextFormField(
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please Enter the Password';
                              } else if (value.length < 5) {
                                return 'Please must be more than 5 characters';
                              }
                            },
                            autofocus: false,
                            //For setting the password Text
                            obscureText: true,
                            maxLength: 14,
                            decoration: InputDecoration(
                             // hintText: 'Password',
                                labelText: 'Password',
                                prefixIcon: Icon(
                                  Icons.lock_open,
                                  color: Colors.red,
                                ),
                                contentPadding:
                                    EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                                border: OutlineInputBorder())),
                      ],
                    ),
                  ),
                  SizedBox(height: 35.0),
                  Container(
                    child: ButtonTheme(
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                      height: 50.0,
                      minWidth: double.infinity,
                      child: RaisedButton(
                        //text-color
                        textColor: Colors.white,
                        //HighLight-color-long-pressed
                        highlightColor: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                        onPressed: () {
                          if (formKey.currentState.validate()) {
                            scaffoldKey.currentState.showSnackBar(
                                SnackBar(content: Text("Login Successfully")));
                            //For Navigating to other screen
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(
                                    builder: (context) => DashBoardScreen()));
                          } else {
                            scaffoldKey.currentState.showSnackBar(
                                SnackBar(content: Text("Error!!!")));
                          }
                        },
                        padding: EdgeInsets.all(12),
                        color: Colors.redAccent,
                        child: Text('Log In',
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Padding(
                      //padding
                      padding: EdgeInsets.all(8.0),
                      child: Text.rich(
                        TextSpan(
                          style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.red,
                              decoration: TextDecoration.underline),
                          text: 'Forget Password?',
                        ),
                        textAlign: TextAlign.center,
                      )),
                  SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset('assets/twitter.png', height: 30.0),
                      SizedBox(width: 20.0),
                      Image.asset('assets/instagram.png', height: 30.0),
                    ],
                  )
                ],
              ),
            ),
          ),
          ),
        );
  }
}

// Email validation
 bool isEmail(String em) {

  String p = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  RegExp regExp = new RegExp(p);

  return regExp.hasMatch(em);
}

