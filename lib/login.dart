import 'package:flutter/material.dart';
import 'package:ultraman/screens/homepage.dart';
  
class login extends StatelessWidget {
  var _formKey = GlobalKey<FormState>();
  var isLoading = false;
 
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Center(child: Text('Ultra Gallery')),
      ),
      //body
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        //form
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 99.0,
        child: Image.asset('assets/logo.png'),
      ),
    ),
              //styling
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.1,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'E-Mail', border: OutlineInputBorder(
  borderSide: BorderSide(
   color: Colors.red, 
    width: 5.0),
    )),
                keyboardType: TextInputType.emailAddress,
                onFieldSubmitted: (value) {
                  //Validator
                },
                validator: (value) {
                  if (value.isEmpty ||
                      !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value)) {
                    return 'Enter a valid email!';
                  }else if(value != 'novan@gmail.com'){
                    return 'Unknow Email!';
                  }else{
                    return null;
                  }
                },
              ),
              //box styling
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.1,
              ),
              //text input 
              TextFormField(
                decoration: InputDecoration(labelText: 'Password', border: OutlineInputBorder(
  borderSide: BorderSide(
   color: Colors.red, 
    width: 5.0),
    )),
                keyboardType: TextInputType.emailAddress,
                onFieldSubmitted: (value) {},
                obscureText: true,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Enter a valid password!';
                  }else if(value != '123'){
                    return 'Wrong Password!';
                  }else{
                    return null;
                  }
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.1,
              ),
              RaisedButton(
                padding: EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 15.0,
                ),
                child: Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
                onPressed: (){
                  final isValid = _formKey.currentState.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState.save();
    Navigator.push(context,MaterialPageRoute(builder: (context) => HomePage()));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}