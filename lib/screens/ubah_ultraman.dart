import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ultraman/screens/homepage.dart';

class ubah_mahasiswa extends StatelessWidget {
  final Map mahasiswa;
  
  ubah_mahasiswa({@required this.mahasiswa});
  final _formKey = GlobalKey<FormState>();
  TextEditingController namCont = TextEditingController();
  TextEditingController alaCont = TextEditingController();
  TextEditingController fotCont = TextEditingController();

  Future ubah() async {
    final response = await http.put(
        Uri.parse("http://10.21.1.209:8000/api/ultraman/" +
            mahasiswa['ult_id'].toString()),
        body: {
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
          title: Text("Update Ultraman"),
        ),
        body: SingleChildScrollView(
          child: Container(
margin: const EdgeInsets.only(right: 20.0, left: 20.0,top: 20.0, bottom: 20.0),
            width: MediaQuery.of(context).size.width*1.0,
            child: Form(
              
              key: _formKey,
              child: Column(
                
                children: [
                  TextFormField(
                    controller: namCont..text = mahasiswa['ult_name'],
                    decoration: InputDecoration(labelText: "Name", border: OutlineInputBorder(
  borderSide: BorderSide(
   color: Colors.red, 
    width: 5.0),
    )),
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
                    controller: alaCont..text = mahasiswa['ult_desc'],
                    decoration: InputDecoration(labelText: "Description", border: OutlineInputBorder(
  borderSide: BorderSide(
   color: Colors.red, 
    width: 5.0),
    )),
                    maxLines: null,
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
                    controller: fotCont..text = mahasiswa['ult_pic'],
                    decoration: InputDecoration(labelText: "Picture", border: OutlineInputBorder(
  borderSide: BorderSide(
   color: Colors.red, 
    width: 5.0),
    )),
                    maxLines: null,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Insert Ultraman Picture !!!";
                      }
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                                padding: EdgeInsets.all(5),
                                height: 120,
                                width: 280,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.network(
                                    mahasiswa['ult_pic'],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                    SizedBox(
                    height: 50,
                  ),
                    ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            ubah().then((value) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomePage()));
                            });
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("Data berhasil Diperbarui"),
                            ));
                          }
                          // else {
        
                          // }
                        },
                        
                        child: Text("Update")),
                ],
              ),
            ),
          ),
        ));
  }
}
