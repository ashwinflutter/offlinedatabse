
import 'package:flutter/material.dart';
import 'package:offlinedatabse/Dbhelper.dart';
import 'package:offlinedatabse/editpage.dart';
import 'package:offlinedatabse/insertpage.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

void main() {
  runApp(MaterialApp(
    home: firstpage(),
  ));
}

class firstpage extends StatefulWidget {
  const firstpage({Key? key}) : super(key: key);

  @override
  _firstpageState createState() => _firstpageState();
}

class _firstpageState extends State<firstpage> {
  Database? db;

  List<Map> userdata = [];
  List<Map> searchlist = [];

  bool status = false;
  bool search = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAlldata();
  }

  void getAlldata() {
    Dbhelper().Forintializedataabase().then((value) {
      db = value;
      setState(() {});
      Dbhelper().viewdata(db!).then((listofmap) {
        userdata = listofmap;
        searchlist = listofmap;

        setState(() {
          status = true;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: status
          ? ListView.builder(itemCount: search? searchlist.length : userdata.length,
              itemBuilder: (context, index) {
              Map mm=search?searchlist[index]:userdata[index];
                return ListTile(
                  onTap: () {

                    String name = "${mm['name']}";
                    String number = "${mm['number']}";
                    int id = mm['id'];

                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return AlertDialog(
                          title: Text("Do You Want To EDIT or DELETE"),
                          actions: [
                            FlatButton(
                                onPressed: () {

                                  Navigator.pop(context);
                                  Navigator.pushReplacement(context,
                                      MaterialPageRoute(
                                    builder: (context) {
                                      return editpage(name, number, id);
                                    },
                                  ));
                                },
                                child: Text("EDIT")),
                            FlatButton(
                                onPressed: () {
                                  Navigator.pop(context);

                                  Dbhelper().deletedata(db!, id).then((value) {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                                      return firstpage();
                                    },));
                                  });
                                },
                                child: Text("DELETE"))
                          ],
                        );
                      },
                    ));
                  },
                  subtitle: Text("${mm['number']}"),
                  textColor: Colors.brown,
                  title: Text("${mm['name']}"),
                );
              },
            )
          : Center(child: CircularProgressIndicator()),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context) {
              return inserpage();
            },
          ));
        },
      ),
      appBar: search
          ? AppBar(
        title: TextField(
          autofocus: true,
          onChanged: (value) {
            setState(() {
              if (value != "") {
                searchlist = [];
                for (int i = 0; i < userdata.length; i++) {
                  String name = "${userdata[i]['name']}";
                  if (name
                      .toLowerCase()
                      .toString()
                      .contains(value.toLowerCase().toString())) {
                    searchlist.add(userdata[i]);
                    print(searchlist);
                  }
                }
              } else {
                searchlist = userdata;
                setState(() {});
              }
            });
          },
        ),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  search = false;
                });
              },
              icon: Icon(Icons.close))
        ],
      )
          : AppBar(
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  search = true;
                });
              },
              icon: Icon(Icons.search_off))
        ],
        title: Text("Contactbook"),
      ),
    );
  }
}
