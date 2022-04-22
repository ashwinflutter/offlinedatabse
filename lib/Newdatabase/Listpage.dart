// import 'package:flutter/material.dart';
// import 'package:offlinedatabse/Newdatabase/Insertpage.dart';
// import 'package:offlinedatabse/Newdatabase/dbhelper.dart';
// import 'package:sqflite/sqflite.dart';
//
// class listpage extends StatefulWidget {
//   const listpage({Key? key}) : super(key: key);
//   @override
//   _listpageState createState() => _listpageState();
// }
//
// class _listpageState extends State<listpage> {
//   Database? db;
//   List<Map> list = [];
//   bool status = false;
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     getAlldata();
//   }
//
//
//   void getAlldata() {
//     Dbhelper().forintilizedatabse().then((value) {
//         db = value;
//         setState(() {
//         });
//         Dbhelper().viewdata(db!).then((userdata) {
//           list = userdata;
//           setState(() {
//           });
//           status = true;
//           print(status);
//         });
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: status
//           ? ListView.builder(itemCount: list.length,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   leading: Text("${list[index]["id"]}"),
//                   subtitle: Text("${list[index]['number']}"),
//                   title: Text("${list[index]['name']}"),
//                 );
//               },
//             )
//           : Center(child: CircularProgressIndicator()),
//       floatingActionButton: FloatingActionButton(
//         child: Icon(Icons.add),
//         onPressed: () {
//           Navigator.pushReplacement(context, MaterialPageRoute(
//             builder: (context) {
//               return insertpage();
//             },
//           ));
//         },
//       ),
//     );
//   }
// }
