import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import 'package:frontend/services/authservice.dart';
// import 'package:frontend/signin.dart';
// import 'package:frontend/user.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:guide_frontend/services/authservice.dart';
import 'package:guide_frontend/signin.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/src/rendering/flex.dart';

import 'camera.dart';
//import 'activities.dart';
// import 'package:frontend/signup.dart';
// import 'package:frontend/dashboard.dart';
// import 'package:frontend/user.dart';


class Signup extends StatefulWidget {
Signup({Key? key}) : super(key: key);
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formKey = GlobalKey<FormState>();
  

// Future save() async {
//     var res = await http.post("http://localhost:3000/signin",
//         headers: <String, String>{
//           'Context-Type': 'application/json;charSet=UTF-8'
//         },
//         body: <String, String>{
//           'username': user.username,
//           'password': user.password
//         });
//     print(res.body);
//     Navigator.push(
//         context, new MaterialPageRoute(builder: (context) => Dashboard()));
//   }

  // User user = User('', '');
  var name, email, password, token, c_password, nic, address, contact_no;
  bool agree = false;
  RegExp pass_valid = RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)");
  double password_strength = 0;
  bool _isVisible = false;
  // 0: No password
  // 1/5: Weak
  // 2/5: Medium
  // 3/5: Strong
  // 4/5: Strong
  //   1:   Great

  //A function that validate user entered password
  bool validatePassword(String pass){
    String _password = pass.trim();

    if(_password.isEmpty){
      setState(() {
        password_strength = 0;
        _isVisible= true;
      });
    }else if(_password.length < 2 ){
      setState(() {
        password_strength = 1 / 5;
        _isVisible= true;
      });
      }else if(_password.length < 4){
      setState(() {
        password_strength = 2 / 5;
        _isVisible= true;
      });
    }else if(_password.length < 5){
      setState(() {
        password_strength = 3 / 5;
        _isVisible= true;
      });
    }else if(_password.length < 6){
      setState(() {
        password_strength = 4 / 5;
        _isVisible= true;
      });  
    }else{
      if(pass_valid.hasMatch(_password)){
        setState(() {
          password_strength = 5 / 5;
          _isVisible= false;
        });
        return true;
      }else{
        setState(() {
          password_strength = 4 / 5;
          _isVisible= true;
        });
        return false;
      }
    }
    return false;
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          // Positioned(
          //   bottom: 25,
          //   child: SvgPicture.asset('images/top.svg',width:350, height:150 ,)),
          //   Positioned(
          //   bottom: 0,
          //   child: SvgPicture.asset('images/top1.svg',width:350, height:100 ,)),
            Container(
              // alignment: Alignment.center,
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      
                      Container(
                      padding: EdgeInsets.only(right:300.0),
                      child: Image.asset('images/withoutSlogan.png',
                          height: 100, width: 150, ),
                    ),
                    
                      Text(
                        "Sign up",
                        style: GoogleFonts.radioCanada(
                            fontWeight: FontWeight.bold,
                            fontSize: 45,
                            color: Color.fromARGB(255, 4, 128, 185)),
                      ),
                      SizedBox(
                        height: 25,
                      ),

                      Padding(
                    padding: const EdgeInsets.fromLTRB(80, 5, 50, 0),
                    child: Row(
                      children: [
                        Text(
                          "Already have an account ? ",
                          style: TextStyle(
                            fontSize: 16,
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                new MaterialPageRoute(
                                    builder: (context) => Signin())
                                    );
                          },
                          child: Text(
                            "Sign In",
                            style: TextStyle(
                              fontSize: 16,
                                color: Color.fromARGB(255, 4, 128, 185),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    )),
                    SizedBox(
                        height: 15,
                      ),

                      Padding( 
                        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                        child: Column(
                          crossAxisAlignment:  CrossAxisAlignment.start,
                          children: [
                            Text(
                          "Full Name",
                          style: TextStyle(
                            fontSize: 16,
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                          
                         TextFormField(
                          controller: TextEditingController(text: name),
                          obscureText: false,
                          onChanged: (value){
                            name= value;
                          },
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return 'Enter your Name';
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            errorStyle: TextStyle(
                              fontSize: 14.0,
                            ),
                            hintText: 'Enter your name',
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: Color.fromARGB(255, 4, 128, 185)),
                             ),
                             focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: Color.fromARGB(255, 4, 128, 185)),
                             ),
                             errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: Colors.red),
                             ),
                             focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: Colors.red),
                             ),
                             
                             ),
                             
              ),
              ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                        child: Column(
                          crossAxisAlignment:  CrossAxisAlignment.start,
                          children: [
                            Text(
                          "Email",
                          style: TextStyle(
                            fontSize: 16,
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        TextFormField(
                          controller: TextEditingController(text: email),
                          onChanged: (value){
                            email= value;
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter your Email';
                            } else if (RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(value)) {
                              return null;
                            } else {
                              return 'Enter valid Email';
                            }
                          }, 
                          decoration: InputDecoration(
                            hintText: 'Example@gamil.com',
                            errorStyle: TextStyle(
                              fontSize: 14.0,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: Color.fromARGB(255, 4, 128, 185)),
                             ),
                             focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: Color.fromARGB(255, 4, 128, 185)),
                             ),
                             errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: Colors.red),
                             ),
                             focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: Colors.red),
                             ),
                             
                             ),
                             
              ),
                          ]),
                      ),
              Padding( 
                        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                        child: Column(
                          crossAxisAlignment:  CrossAxisAlignment.start,
                          children: [
                            Text(
                          "NIC",
                          style: TextStyle(
                            fontSize: 16,
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        TextFormField(
                          controller: TextEditingController(text: nic),
                          obscureText: false,
                          onChanged: (value){
                            nic= value;
                          },
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return 'Enter your NIC';
                            } 
                            else if (RegExp(
                                    r"^([0-9]{9}[x|X|v|V]|[0-9]{12})$")
                                .hasMatch(value)) {
                              return null;
                            }
                            else {
                              return "Enter a valid NIC";
                            }
                          },
                          decoration: InputDecoration(
                            errorStyle: TextStyle(
                              fontSize: 14.0,
                            ),
                            hintText: 'Enter your NIC',
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: Color.fromARGB(255, 4, 128, 185)),
                             ),
                             focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: Color.fromARGB(255, 4, 128, 185)),
                             ),
                             errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: Colors.red),
                             ),
                             focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: Colors.red),
                             ),
                             
                             ),
                             
              ),
                          ]),
                      ),
              Padding( 
                        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                        child: Column(
                          crossAxisAlignment:  CrossAxisAlignment.start,
                          children: [
                            Text(
                          "Address",
                          style: TextStyle(
                            fontSize: 16,
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        TextFormField(
                          controller: TextEditingController(text: address),
                          obscureText: false,
                          onChanged: (value){
                            address= value;
                          },
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return 'Enter your Address';
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            errorStyle: TextStyle(
                              fontSize: 14.0,
                            ),
                            hintText: 'Enter your address',
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: Color.fromARGB(255, 4, 128, 185)),
                             ),
                             focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: Color.fromARGB(255, 4, 128, 185)),
                             ),
                             errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: Colors.red),
                             ),
                             focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: Colors.red),
                             ),
                             
                             ),
                             
              ),
                          ]),
                      ),
                      Padding( 
                        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                        child: Column(
                          crossAxisAlignment:  CrossAxisAlignment.start,
                          children: [
                            Text(
                          "Contact No",
                          style: TextStyle(
                            fontSize: 16,
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ), 
                        TextFormField(
                          controller: TextEditingController(text: contact_no),
                          obscureText: false,
                          onChanged: (value){
                            contact_no= value;
                          },
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return 'Enter your Contact No';
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            errorStyle: TextStyle(
                              fontSize: 14.0,
                            ),
                            hintText: 'Enter your contact no',
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: Color.fromARGB(255, 4, 128, 185)),
                             ),
                             focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: Color.fromARGB(255, 4, 128, 185)),
                             ),
                             errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: Colors.red),
                             ),
                             focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: Colors.red),
                             ),
                             
                             ),
                             
              ),
                          ]),
                      ),
                      
              Padding( 
                        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                        child: Column(
                          crossAxisAlignment:  CrossAxisAlignment.start,
                          children: [
                            Text(
                          "Password",
                          style: TextStyle(
                            fontSize: 16,
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        TextFormField(
                          controller: TextEditingController(text: password),
                          obscureText: true,
                          onChanged: (value){
                            password= value;
                          },
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return 'Enter your Password';
                            } else {//call function to check password
                                  bool result = validatePassword(value);
                                  if(result){
                                    // create account event
                                    return null;
                                  
                                  }else{
                                    return " Password should contain: \n - A capital letter \n - A simple letter \n - A number \n - A special character";
                                  }
                                }
                          },
                          decoration: InputDecoration(
                            errorStyle: TextStyle(
                              fontSize: 14.0,
                            ),
                            hintText: 'Password',
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: Color.fromARGB(255, 4, 128, 185)),
                             ),
                             focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: Color.fromARGB(255, 4, 128, 185)),
                             ),
                             errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: Colors.red),
                             ),
                             focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: Colors.red),
                             ),
                             
                             ),
                             
              ),
                          ]),
                      ),
                      Padding(
                            padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                            child: Visibility (
                            visible: _isVisible,
                            child: LinearProgressIndicator(
                              value: password_strength,
                              backgroundColor: Colors.grey[300],
                              minHeight: 5,
                              color: password_strength <= 1 / 5
                                  ? Colors.red
                                   :password_strength <= 2 / 5
                                  ? Colors.orange
                                  : password_strength == 3 / 5
                                  ? Colors.yellow
                                  : password_strength == 4 / 5
                                  ? Colors.blue
                                  : Colors.green,
                            ),
              ),),
              Padding( 
                        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                        child: Column(
                          crossAxisAlignment:  CrossAxisAlignment.start,
                          children: [
                            Text(
                          "Confirm Password",
                          style: TextStyle(
                            fontSize: 16,
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        TextFormField(
                          controller: TextEditingController(text: c_password),
                          obscureText: true,
                          onChanged: (value){
                            c_password= value;
                          },
                          validator: (String? value) {

                            if (value!.isEmpty) {
                              return 'Confirm your Password';
                            } else if (c_password!=password || !validatePassword(c_password)) {
                              return 'Re-Entered Password didn\'t match';
                            } else if(c_password==password && validatePassword(c_password)){
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            errorStyle: TextStyle(
                              fontSize: 14.0,
                            ),
                            hintText: 'Confirm Password',
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: Color.fromARGB(255, 4, 128, 185)),
                             ),
                             focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: Color.fromARGB(255, 4, 128, 185)),
                             ),
                             errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: Colors.red),
                             ),
                             focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: Colors.red),
                             ),
                             
                             ),
                             
              ),
                          ]),
                      ),
                      Padding(
                    padding: const EdgeInsets.fromLTRB(70, 0, 0, 0),
                    child: Row(
                      children: [
                        Material(
                          child: Checkbox(
                            value: agree,
                            onChanged: (value) {
                              setState(() {
                                agree = value ?? false;
                              });
                            },
                          ),
                        ),
                        Text(
                          "I agree to the terms and conditions ",
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ],
                    )),       
                    SizedBox(
                        height: 15,
                      ),
                      Padding(
                  padding: EdgeInsets.fromLTRB(20, 16, 20, 16),
                  
                    child:Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        height: 50,
                        width: 300,
                        child: TextButton(
                          onPressed: () { 
                            if (_formKey.currentState!.validate()) {
                              print("ok");
                              // save();
                              if(agree == false)
                              {
                                Fluttertoast.showToast(
                                msg: "Agree to our terms and conditions",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                backgroundColor: Colors.red,
                                textColor:Colors.white,
                                fontSize:16.0
                                );
                              }
                              if (agree == true) 
                              {
                            Navigator.push(
                                context,
                                new MaterialPageRoute(
                                    builder: (context) => Home( name, email, password, nic, address, contact_no))
                                    );
                            // if (_formKey.currentState!.validate()) {
                            //   print("ok");
                            //   // save();
                            //  } else {
                            //     print("not ok");
                            //   }
                      //       {
                      //        AuthService().addUser(name, email, nic, address,contact_no, password).then((val) {
                      //            Fluttertoast.showToast(
                      //             msg: val.data['msg'],
                      //             toastLength: Toast.LENGTH_SHORT,
                      //             gravity: ToastGravity.BOTTOM,
                      //             timeInSecForIosWeb: 1,
                      //             backgroundColor: Colors.green,
                      //             textColor:Colors.white,
                      //             fontSize:16.0
                      // );
                      //           });
                      //         }
                      }
                             } else {
                                print("not ok");
                                
                              }
                            {
                             
                              } 
                            }, 
                            
                            child: Text("Continue", style: TextStyle(fontSize: 20),),
                            style: TextButton.styleFrom(
                              primary: Colors.white,  //Text Color
                              backgroundColor: Color.fromARGB(255, 4, 128, 185),
                              shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                            ),
                          ),
                      ),
                    ),
                ),
                SizedBox(
                        height: 10,
                      ), 
                
        ],
                  ),
                ))
    ]));
  }
}

