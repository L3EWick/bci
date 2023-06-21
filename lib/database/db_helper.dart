import 'package:sqflite/sqflite.dart' as sql;

class SQLHelper{
  static Future<void> createTables(sql.Database database) async{
    await database.execute("""
      CREATE TABLE data(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        requerente TEXT,
        endereco TEXT,
        bairro TEXT,
        telefone TEXT,
        attold TEXT,
        att TEXT,
        atcold TEXT,
        processnumber TEXT,
        contribuinte TEXT,
        proprietario TEXT,
        lote TEXT,
        uso TEXT,
        concervacao TEXT,
        revestimento TEXT,
        cobertura TEXT,
        estrutura TEXT,
        complemento TEXT,
        unidades TEXT,
        selectlote TEXT,
        selectnumunid TEXT,
        selectrelevo TEXT,
        selectmuro TEXT
        selectuso TEXT,
        selectconservacao TEXT,
        selectrevestimento TEXT,
        selectcobertura TEXT,
        selectestrutura TEXT,
        createdAT TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
      )
""");
  }

  static Future<sql.Database> db() async{
    return sql.openDatabase(
      "database_name.db",
      version:1,
      onCreate: (sql.Database database, int version) async{
        await createTables (database);
      });
  }

  static Future<int> createData(String? requerente, 
                                String? endereco,
                                String? bairro,
                                String? telefone,
                                String? attold,
                                String? att,
                                String? atcold,
                                String? processnumber,
                                String? contribuinte,
                                String? proprietario,
                                String? lote,
                                String? uso,
                                String? concervacao,
                                String? revestimento,
                                String? cobertura,
                                String? estrutura,
                                String? complemento,
                                String? unidades,
                                String? selectlote,
                                String? selectnumunid,
                                String? selectrelevo,
                                String? selectmuro,
                                String? selectuso,
                                String? selectconservacao,
                                String? selectrevestimento,
                                String? selectcobertura,
                                String? selectestrutura
                              ) 
  async{
    final db = await SQLHelper.db();

    final data = {
      'requerente'          : requerente, 
      'endereco'            : endereco,
      'bairro'              : bairro,
      'telefone'            : telefone,
      'attold'              : attold,
      'att'                 : att,
      'atcold'              : atcold,
      'processnumber'       : processnumber,
      'contribuinte'        : contribuinte,
      'proprietario'        : proprietario,
      'lote'                : lote,
      'uso'                 : uso,
      'concervacao'         : concervacao,
      'revestimento'        : revestimento,
      'cobertura'           : cobertura,
      'estrutura'           : estrutura,
      'complemento'         : complemento,
      'unidades'            : unidades,
      'selectlote'          : selectlote, 
      'selectnumunid'       : selectnumunid,
      'selectrelevo'        : selectrelevo,
      'selectmuro'          : selectmuro, 
      'selectconservacao'   : selectconservacao,
      'selectrevestimento'  : selectrevestimento,
      'selectcobertura'     : selectcobertura, 
      'selectestrutura'     : selectestrutura, 

      };
    final id = await db.insert('data', data,conflictAlgorithm: sql.ConflictAlgorithm.replace);
    
    return id;
  }

  static Future<List<Map<String, dynamic>>> getAllData() async{
    final db = await SQLHelper.db();
    return db.query('data', orderBy: 'id');
  }

  static Future<List<Map<String, dynamic>>> getSingleData(int id) async{

    final db = await SQLHelper.db();
    return db.query('data', where: "id = ?", whereArgs: [id], limit: 1);
  }

  static Future<int> updateData(int id, 
                                String? requerente, 
                                String? endereco,
                                String? bairro,
                                String? telefone,
                                String? attold,
                                String? att,
                                String? atcold,
                                String? processnumber,
                                String? contribuinte,
                                String? proprietario,
                                String? lote,
                                String? uso,
                                String? concervacao,
                                String? revestimento,
                                String? cobertura,
                                String? estrutura,
                                String? complemento,
                                String? unidades,
                                String? selectlote,
                                String? selectnumunid,
                                String? selectrelevo,
                                String? selectmuro,
                                String? selectuso,
                                String? selectconservacao,
                                String? selectrevestimento,
                                String? selectcobertura,
                                String? selectestrutura) 
    async{

    final db = await SQLHelper.db();
    final data = {
      'requerente'          : requerente, 
      'endereco'            : endereco,
      'bairro'              : bairro,
      'telefone'            : telefone,
      'attold'              : attold,
      'att'                 : att,
      'atcold'              : atcold,
      'processnumber'       : processnumber,
      'lote'                : lote,
      'uso'                 : uso,
      'concervacao'         : concervacao,
      'revestimento'        : revestimento,
      'cobertura'           : cobertura,
      'estrutura'           : estrutura,
      'complemento'         : complemento,
      'unidades'            : unidades,
      'selectlote'          : selectlote, 
      'selectnumunid'       : selectnumunid,
      'selectrelevo'        : selectrelevo,
      'selectconservacao'   : selectconservacao,
      'selectrevestimento'  : selectrevestimento,
      'selectcobertura'     : selectcobertura, 
      'selectestrutura'     : selectestrutura, 
      'createdAt' : DateTime.now().toString()
  };
    final result = await db.update('data', data, where: "id = ?", whereArgs: [id]);
    return result;
  }

  static Future<void> deleteData(int id) async{
    final db = await SQLHelper.db();
    try{
      await db.delete('data',  where: "id = ?", whereArgs: [id]);
    }catch(e){}
  }
}

