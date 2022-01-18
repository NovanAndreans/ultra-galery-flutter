import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ultraman/screens/homepage.dart';

class tambah_ultraman extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  TextEditingController namCont = TextEditingController();
  TextEditingController alaCont = TextEditingController();
  TextEditingController fotCont = TextEditingController();
  Future save() async {
    final response = await http
        .post(Uri.parse("http://10.21.1.209:8000/api/ultraman"), body: {
      "ult_name": namCont.text,
      "ult_desc": alaCont.text,
      "ult_pic": fotCont.text,
    });
    return jsonDecode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Add Ultraman"),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.only(right: 20.0, left: 20.0,top: 20.0, bottom: 20.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: namCont,
                    decoration: InputDecoration(labelText: "Name", border: OutlineInputBorder(
  borderSide: BorderSide(
   color: Colors.red, 
    width: 5.0),
    ) ),
                      maxLines: null,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Insert Ultraman Name !!!";
                      }
                    },
                  ),

                      SizedBox(
                      height: 20,
                    ),
                  TextFormField(
                    controller: alaCont,
                      maxLines: null,
                    decoration: InputDecoration(labelText: "Description", border: OutlineInputBorder(
  borderSide: BorderSide(
   color: Colors.red, 
    width: 5.0),
    )),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Insert Ultraman Description !!!";
                      }
                    },
                  ),
                      SizedBox(
                      height: 20,
                    ),
                  TextFormField(
                    controller: fotCont,
                      maxLines: null,
                    decoration: InputDecoration(labelText: "Image url", border: OutlineInputBorder(
  borderSide: BorderSide(
   color: Colors.red, 
    width: 5.0),
    )),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Insert Ultraman Picture !!!";
                      }
                    },
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          save().then((value) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage()));
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("Data berhasil Ditambahkan"),
                            ));
                          });
                        }
                        // else {
        
                        // }
                      },
                      child: Text("Save")),
                ],
              ),
            ),
          ),
        ));
  }
}
