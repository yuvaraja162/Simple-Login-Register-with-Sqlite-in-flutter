import 'package:sqflite/sqflite.dart'as sql;

class DatabaseHandler
{
  static Future<void> createTables(sql.Database database)async
  {
    await database.execute("""CREATE TABLE user(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        username TEXT,
        password TEXT,
        email TEXT,
        phoneno TEXT,
        createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP)""");
  }

  static Future<sql.Database> db() async
  {
    return sql.openDatabase(
      'login.db',
      version: 1,
      onCreate: (sql.Database database,int version) async
        {
          await createTables(database);
        }
    );
  }

  static Future<int> createUser(String username,String password,String email,String phoneno)async{
    final db=await DatabaseHandler.db();
    final data={
      'username':username,
      'password':password,
      'email':email,
      'phoneno':phoneno,
    };
    final id=await db.insert('user', data,conflictAlgorithm: sql.ConflictAlgorithm.replace);


    return id;
  }

  static Future<List<Map<String, dynamic>>> getItem(String username, String password) async {
    final db = await DatabaseHandler.db();
    return db.query('user', where: "username = ? AND password=? ", whereArgs: [username,password]);
  }

  static Future<List<Map<dynamic,dynamic>>>getItems() async
  {
    final db=await DatabaseHandler.db();
    return db.query('user');

  }
}