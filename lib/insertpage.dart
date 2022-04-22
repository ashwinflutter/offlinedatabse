import 'package:flutter/material.dart';
import 'package:offlinedatabse/Dbhelper.dart';
import 'package:offlinedatabse/main.dart';
import 'package:sqflite/sqflite.dart';

class inserpage extends StatefulWidget {
  const inserpage({Key? key}) : super(key: key);

  @override
  _inserpageState createState() => _inserpageState();
}

class _inserpageState extends State<inserpage> {

  Database? db;
  TextEditingController name = TextEditingController();
  TextEditingController number = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Dbhelper().Forintializedataabase().then((value) {

      db=value;
      setState(() {

      });
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: name,
          ),
          TextField(
            controller: number,
          ),
          ElevatedButton(onPressed: () {

            String ename = name.text;
            String enumber = number.text;
       Dbhelper().insertdata(db!,ename,enumber).then((value) {
         Navigator.push(context, MaterialPageRoute(builder: (context) {
           return firstpage();
         },));
       });
       }, child: Text("Insert"))
        ],
      ),
    );
  }
}
