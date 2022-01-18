import 'package:flutter/material.dart';

class mahasiswa_detail extends StatelessWidget {
  final Map ultraman;

  mahasiswa_detail({@required this.ultraman});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text("Detail Ultraman"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 20.0),
                child: Image.network(ultraman['ult_pic']),
                
              ),
              SizedBox(
                height: 20,
              ),
                    Text(ultraman['ult_name'], style: TextStyle(fontSize: 42)),
                    // Row(
                    //   children: [Icon(Icons.edit), Icon(Icons.delete)],
                    // )
              Container(
                padding: const EdgeInsets.all(16.0),
                width: MediaQuery.of(context).size.width*1.0,
                child: Column(
                children: [
                  Text(ultraman['ult_desc'],style: TextStyle(
    height: 2.0 
  )),
                ],
              )),
            ],
          ),
        ));
  }
}
