import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ultraman/login.dart';
import 'package:ultraman/screens/ultraman_detail.dart';
import 'package:ultraman/screens/tambah_ultraman.dart';
import 'package:ultraman/screens/ubah_ultraman.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String url = 'http://10.21.1.209:8000/api/ultraman';

  getProducts() async {
    var response = await http.get(Uri.parse(url));
    print(json.decode(response.body));
    return json.decode(response.body);
  }

  Future hapus(String idMahasiswa) async {
    String url = 'http://10.21.1.209:8000/api/ultraman/' + idMahasiswa;
    var response = await http.delete(Uri.parse(url));
    return jsonDecode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    getProducts();
    return Scaffold(
        floatingActionButton: 
              FloatingActionButton(
                child: Icon(Icons.add),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => tambah_ultraman()));
                },
              ),
        
        appBar: AppBar(
          leading: IconButton(
    icon: Icon(Icons.door_front_door),
    onPressed: () => Navigator.of(context).pop(),
  ), 
          title: Center(child: Text('Ultra Gallery')),
        ),
        body: FutureBuilder(
          future: getProducts(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data['data'].length,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 180,
                      child: Card(
                        elevation: 5,
                        child: Row(
                          children: [
                            
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.all(25.0),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Align(
                                      alignment: Alignment.topCenter,
                                      child: Text(
                                        snapshot.data['data'][index]['ult_name'],
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          ubah_mahasiswa(
                                                            mahasiswa: snapshot
                                                                    .data[
                                                                'data'][index],
                                                          )));
                                            },
                                            child: Icon(Icons.edit)),
                                            
                                        GestureDetector(
                                            onTap: () {
                                              hapus(snapshot.data['data'][index]
                                                          ['ult_id']
                                                      .toString())
                                                  .then((value) => {
                                                        setState(() {}),
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                                SnackBar(
                                                          content: Text(
                                                              "Data berhasil Dihapus"),
                                                        ))
                                                      });
                                            },
                                            child: Icon(Icons.delete)),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => mahasiswa_detail(
                                              ultraman: snapshot.data['data']
                                                  [index],
                                            )));
                              },
                              child: Container(
                                margin: const EdgeInsets.only(right: 25.0),
                                padding: EdgeInsets.all(5),
                                height: 120,
                                width: 280,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.network(
                                    snapshot.data['data'][index]['ult_pic'],
                                    fit: BoxFit.cover, 
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  });
            } else {
              return Text('data error');
            }
          },
        ));
  }
}
