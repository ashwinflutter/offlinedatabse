// import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';
//
// class Dbhelper {
//   Future<Database> forintilizedatabse() async {
//     // Get a location using getDatabasesPath
//     var databasesPath = await getDatabasesPath();
//     String path = join(databasesPath, 'hh.db');
//     // open the database
//     Database database = await openDatabase(path, version: 1,
//         onCreate: (Database db, int version) async {
//       // When creating the db, create the table
//       await db.execute(
//           'Create Table ContactBook (id integer primary key Autoincrement, name Text ,number Text)');
//     });
//     return database;
//   }
//   Future<void> insertdata(
//       String namee, String numbere, Database database) async {
//     String inserrtt =
//         "insert into ContactBook  (name,number)   values('$namee','$numbere')";
//     int cnt = await database.rawInsert(inserrtt);
//     print(cnt);
//   }
//
//   Future<List<Map>> viewdata(Database database) async {
//     String select = "select * from ContactBook";
//     List<Map> list = await database.rawQuery(select);
//     print(list);
//     return list;
//   }
// }
