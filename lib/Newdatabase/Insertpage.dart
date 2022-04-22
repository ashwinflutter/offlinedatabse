// import 'package:flutter/material.dart';
// import 'package:offlinedatabse/Dbhelper.dart';
// import 'package:offlinedatabse/Newdatabase/dbhelper.dart';
// import 'package:sqflite/sqflite.dart';
//
// import 'Listpage.dart';
//
// class insertpage extends StatefulWidget {
//   const insertpage({Key? key}) : super(key: key);
//
//   @override
//   _insertpageState createState() => _insertpageState();
// }
//
// class _insertpageState extends State<insertpage> {
//   TextEditingController name = TextEditingController();
//   TextEditingController number = TextEditingController();
//   Database? db ;
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//
//     Getdatabse();
//   }
//
//   void Getdatabse() {
//     Dbhelper().forintilizedatabse().then((value) {
//       db=value;
//       setState(() {
//
//       });
//
//     });
//
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Container(
//             margin: EdgeInsets.all(10),
//             child: TextField(
//
//               decoration: InputDecoration(
//                   icon: Icon(Icons.people), border: OutlineInputBorder()),
//               controller: name,
//             ),
//           ), Container(
//             margin: EdgeInsets.all(10),
//             child: TextField(
//               decoration: InputDecoration(icon: Icon(Icons.phone),
//                    border: OutlineInputBorder()),
//               controller: number,
//             ),
//           ),ElevatedButton(onPressed: () {
//
//             String namee = name.text;
//             String numbere = number.text;
//
//        Dbhelper().insertdata(namee,numbere,db!).then((value) {
//
//          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
//            return listpage();
//          },));
//
//        });
//
//           }, child: Text("Insert"))
//         ],
//       ),
//       appBar: AppBar(
//         title: Text("Insertpage"),
//       ),
//     );
//   }
//
//
// }
