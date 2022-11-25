import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:para_2/common/data_base_request.dart';

import 'package:para_2/data/model/categories.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DataBaseHelper {
  static final DataBaseHelper instance = DataBaseHelper._instance();
  DataBaseHelper._instance();

  late final Directory _appDocumentDirectory;
  late final String _pathDB;
  late final Database database;
  final int _version = 1;

  Future<void> init() async {
    _appDocumentDirectory =
      await path_provider.getApplicationDocumentsDirectory();
    _pathDB = join(_appDocumentDirectory!.path, 'bookstore.db');

    if (Platform.isLinux || Platform.isWindows || Platform.isMacOS){
      
    }else{ 
      database = await openDatabase (
        _pathDB, 
        version: _version, 
        onUpgrade: (db, oldVersion, newVersion) async {
          await onUpdateTable(db);
        },
        onCreate: (db, version)async {
          await onCreateTable(db);
        },);

    }
  }

  Future <void> onUpdateTable(Database db) async {
    var table = await db.rawQuery('SELECT name From sqlite_master;');
    for (var i =0; i<DataBaseRequest.tableList.reversed.length; i++)
    {
      if (table.where((element) => element['name']==DataBaseRequest.tableList[i]).isNotEmpty)
      {
        await db.execute(DataBaseRequest.deleteTable(DataBaseRequest.tableList[i]));
      }
    }
    for (var element in DataBaseRequest.tableCreateList){
      await db.execute(element);
    }
    await onInitTable(db);
  }

  Future<void> onCreateTable(Database db) async{
    for (var i=0; i<DataBaseRequest.tableList.length; i++)
    {
      db.execute(DataBaseRequest.tableCreateList[i]);
    }
  }

  Future<void> onInitTable(Database db) async {
    try{
     
      
    } on DatabaseException catch (e) {
      print(e.getResultCode());
    }
  }




  Future<void> onDropDataBase() async{
    database.close();
    if (Platform.isLinux || Platform.isWindows || Platform.isMacOS){}
      else{
        deleteDatabase(_pathDB);
      } 
  }
} 