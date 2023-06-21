import 'package:flutter/material.dart';
import 'package:bci/database/db_helper.dart';
import 'package:bci/screen/utils/drawer_list.dart';
import 'package:location/location.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> _allData = [];

  bool _isLoading = true;

//get all data from database
  void _refreshData() async {
    final data = await SQLHelper.getAllData();
    setState(() {
      _allData = data;
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _refreshData();
    _latitude = 000000;
    _longitude = 000000;
    pegaLocaliza();
  }

  late dynamic _latitude;
  late dynamic _longitude;

  Future pegaLocaliza() async {
    var location = Location();
    if (!await location.serviceEnabled()) {
      if (!await location.requestService()) {
        return;
      }
    }
    var permission = await location.hasPermission();
    if (permission == PermissionStatus.denied) {
      permission = await location.requestPermission();
      if (permission != PermissionStatus.granted) {
        return;
      }
    }
    var loc = await location.getLocation();
    // print("${loc.latitude} ${loc.longitude}");

    _latitude = loc.latitude;
    _longitude = loc.longitude;
  }

//new data
  Future<void> _addData() async {
    await SQLHelper.createData(
      _tRequerente.text,
      _tEndereco.text,
      _tBairro.text,
      _tTelefone.text,
      _tATTold.text,
      _tAtt.text,
      _tATCold.text,
      _tProcessnumber.text,
      _tContribuinte.text,
      _tProprietario.text,
      _tLote.text,
      _tUso.text,
      _tConservacao.text,
      _tRevestimento.text,
      _tCobertura.text,
      _tEstrutura.text,
      _tComplemento.text,
      _tUnidades.text,
      _mySelectionLote,
      _mySelectionNumUnid,
      _mySelectionRelevo,
      _mySelectionMuro,
      _mySelectionUso,
      _mySelectionConservacao,
      _mySelectionRevestimento,
      _mySelectionCobertura,
      _mySelectionEstrutura,
    );
    _refreshData();
  }

//update
  Future<void> _updateData(int id) async {
    await SQLHelper.updateData(
      id,
      _tRequerente.text,
      _tEndereco.text,
      _tBairro.text,
      _tTelefone.text,
      _tATTold.text,
      _tAtt.text,
      _tATCold.text,
      _tProcessnumber.text,
      _tContribuinte.text,
      _tProprietario.text,
      _tLote.text,
      _tUso.text,
      _tConservacao.text,
      _tRevestimento.text,
      _tCobertura.text,
      _tEstrutura.text,
      _tComplemento.text,
      _tUnidades.text,
      _mySelectionLote,
      _mySelectionNumUnid,
      _mySelectionRelevo,
      _mySelectionMuro,
      _mySelectionUso,
      _mySelectionConservacao,
      _mySelectionRevestimento,
      _mySelectionCobertura,
      _mySelectionEstrutura,
    );
    _refreshData();
  }

//delete
  void _deleteData(int id) async {
    await SQLHelper.deleteData(id);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        backgroundColor: Colors.redAccent,
        content: Text("Deletado com sucesso")));

    _refreshData();
  }

  String uni = '1';

  List lote = ['VAGO', 'EDIFICADO'];

  List relevo = ['ACLIVE', 'DECLIVE', 'PLANO'];

  List muro = ['SIM', "NÃO"];

  List uso = [
    'RESIDENCIAL',
    'TERRITORIAL',
    'COMERCIAL',
    'RELIGIOSO',
    'PRESTAÇÃO DE SERVIÇOS',
    'INDUTRIAL',
    'GOVERNAMENTAL',
    'NATUREZA',
    'CASA',
    'APARTAMENTO',
    'LOJA',
    'SALA',
    'GALPÃO',
    'TELHEIRO'
  ];

  List tipologia = ['GEMINADA', 'ISOLADO'];

  List conservacao = ['ÓTIMO', 'BOA', 'RUIM', 'RUÍNAS'];

  List revestimento = ['PEDRAS', 'MÁRMORES', 'CERÂMICA', 'PINTURA', 'EMBOÇO'];

  List estrutura = [
    'ALVENARIA',
    'CONCRETO',
    'MADEIRA',
    'METÁLICA',
  ];

  List cobertura = [
    'LAJE',
    'TELHA CERÂMICA',
    'TELHA METÁLICA',
    'TELHA DE AMIANTO'
  ];

  List Nunid = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10'];

  final TextEditingController _tRequerente = TextEditingController();
  final TextEditingController _tEndereco = TextEditingController();
  final TextEditingController _tBairro = TextEditingController();
  final TextEditingController _tTelefone = TextEditingController();
  final TextEditingController _tATTold = TextEditingController();
  final TextEditingController _tAtt = TextEditingController();
  final TextEditingController _tATCold = TextEditingController();
  final TextEditingController _tProcessnumber = TextEditingController();
  final TextEditingController _tContribuinte = TextEditingController();
  final TextEditingController _tProprietario = TextEditingController();
  final TextEditingController _tLote = TextEditingController();
  final TextEditingController _tUso = TextEditingController();
  final TextEditingController _tConservacao = TextEditingController();
  final TextEditingController _tRevestimento = TextEditingController();
  final TextEditingController _tCobertura = TextEditingController();
  final TextEditingController _tEstrutura = TextEditingController();
  final TextEditingController _tComplemento = TextEditingController();
  final TextEditingController _tUnidades = TextEditingController();
  dynamic _mySelectionLote;
  dynamic _mySelectionNumUnid;
  dynamic _mySelectionRelevo;
  dynamic _mySelectionMuro;
  dynamic _mySelectionUso;
  dynamic _mySelectionConservacao;
  dynamic _mySelectionRevestimento;
  dynamic _mySelectionCobertura;
  dynamic _mySelectionEstrutura;

  void showBottomSheet(int? id) async {
    if (id != null) {
      final existingData =
          _allData.firstWhere((element) => element['id'] == id);
      _tRequerente.text = existingData['requerente'];
      _tEndereco.text = existingData['endereco'];
      _tBairro.text = existingData['bairro'];
      _tTelefone.text = existingData['telefone'];
      _tATTold.text = existingData['attold'];
      _tAtt.text = existingData['att'];
      _tATCold.text = existingData['atcold'];
      _tProcessnumber.text = existingData['processnumber'];
      _tContribuinte.text = existingData['contribuinte'];
      _tProprietario.text = existingData['proprietario'];
      _tLote.text = existingData['lote'];
      _tUso.text = existingData['uso'];
      _tConservacao.text = existingData['concervacao'];
      _tRevestimento.text = existingData['revestimento'];
      _tCobertura.text = existingData['cobertura'];
      _tEstrutura.text = existingData['estrutura'];
      _tComplemento.text = existingData['complemento'];
      _tUnidades.text = existingData['unidades'];
      _mySelectionLote = existingData['selectlote'];
      _mySelectionNumUnid = existingData['selectnumunid'];
      _mySelectionRelevo = existingData['selectrelevo'];
      _mySelectionMuro = existingData['selectmuro'];
      _mySelectionUso = existingData['selectuso'];
      _mySelectionConservacao = existingData['selectconservacao'];
      _mySelectionRevestimento = existingData['selectrevestimento'];
      _mySelectionCobertura = existingData['selectcobertura'];
      _mySelectionEstrutura = existingData['selectestrutura'];
    }

    showModalBottomSheet(
      elevation: 5,
      isScrollControlled: true,
      context: context,
      builder: (_) => Container(
        padding: EdgeInsets.only(
          top: 30,
          left: 15,
          right: 15,
          bottom: MediaQuery.of(context).viewInsets.bottom + 50,
        ),
        child: ListView(
          children: [
            Column(
              children: [
                Container(
                    width: 100,
                    height: 100,
                    child: Image.asset('assets/img/logo.png')),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'ESTADO DO RIO DE JANEIRO',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 10),
                ),
                Text(
                  'PREFEITURA DA CIDADE DE MESQUITA',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 10),
                ),
                Text(
                  'SECRETARIA MUNICIPAL DA FAZENDA',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 10),
                ),
                TextFormField(
                  controller: _tProcessnumber,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "Nº de Processo",
                      hintText: "Nº de Processo",
                      icon: Icon(Icons.file_copy_sharp)),
                ),
                TextFormField(
                  controller: _tAtt,
                  keyboardType: TextInputType.number,
                  maxLines: null,
                  decoration: InputDecoration(
                      hintText: 'ATT ',
                      labelText: 'ATT ',
                      icon: Icon(Icons.queue_sharp)),
                ),
                TextFormField(
                  controller: _tATTold,
                  keyboardType: TextInputType.number,
                  maxLines: null,
                  decoration: InputDecoration(
                      hintText: 'ATT Anterior',
                      labelText: 'ATT Anterior',
                      icon: Icon(Icons.queue_sharp)),
                ),
                TextFormField(
                  controller: _tATCold,
                  keyboardType: TextInputType.number,
                  maxLines: null,
                  decoration: InputDecoration(
                      hintText: 'ATC Anterior',
                      labelText: 'ATC Anterior',
                      icon: Icon(Icons.queue_sharp)),
                ),
              ],
            ),
            SizedBox(height: 30),
            Column(
              children: [
                Text(
                  'Boletim de Cadastro Imobiliário',
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ],
            ),
            SizedBox(height: 10),
            const Padding(padding: EdgeInsets.only(top: 5.0)),
            TextFormField(
              controller: _tRequerente,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: InputDecoration(
                  hintText: 'Requerente',
                  labelText: 'Requerente',
                  icon: Icon(Icons.supervisor_account_sharp)),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: _tEndereco,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: InputDecoration(
                hintText: 'Endereço',
                labelText: 'Endereço',
                icon: Icon(Icons.add_location_rounded),
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: _tBairro,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: const InputDecoration(
                hintText: 'Bairro',
                labelText: 'Bairro',
                icon: Icon(Icons.add_home_work_rounded),
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: _tTelefone,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: const InputDecoration(
                hintText: 'Telefone',
                labelText: 'Telefone',
                icon: Icon(Icons.phone),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Vistoria',
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _tContribuinte,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: InputDecoration(
                  hintText: 'Contribuinte',
                  labelText: 'Contribuinte',
                  icon: Icon(Icons.view_agenda)),
            ),
            const SizedBox(height: 15),
            TextFormField(
              controller: _tComplemento,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: InputDecoration(
                  hintText: 'Complemento',
                  labelText: 'Complemento',
                  icon: Icon(Icons.add_location_rounded)),
            ),
            const SizedBox(height: 15),
            DropdownButtonFormField(
              decoration: const InputDecoration(
                filled: true,
                labelText: 'Nº Unidades',
              ),
              hint: const Text("Nº Unidades"),
              items: Nunid.map((item) {
                return DropdownMenuItem(
                  child: Text(item),
                  value: item.toString(),
                );
              }).toList(),
              onChanged: (newVala) {
                setState(() {
                  _mySelectionNumUnid = newVala;
                });
              },
              value: _mySelectionNumUnid,
            ),
            const SizedBox(height: 20),
            const Text(
              'Classificação do Imóvel',
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(children: [
              Expanded(
                child: DropdownButtonFormField(
                    decoration: const InputDecoration(
                      filled: true,
                      labelText: 'Lote',
                    ),
                    hint: const Text("Lote"),
                    items: lote.map((item) {
                      return DropdownMenuItem(
                        child: Text(item),
                        value: item.toString(),
                      );
                    }).toList(),
                    onChanged: (newVala) {
                      setState(() {
                        _mySelectionLote = newVala;
                      });
                    },
                    value: _mySelectionLote),
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: DropdownButtonFormField(
                    decoration: const InputDecoration(
                      filled: true,
                      labelText: 'Relevo',
                    ),
                    hint: const Text("Relevo"),
                    items: relevo.map((item) {
                      return DropdownMenuItem(
                        child: Text(item),
                        value: item.toString(),
                      );
                    }).toList(),
                    onChanged: (newVala) {
                      setState(() {
                        _mySelectionRelevo = newVala;
                      });
                    },
                    value: _mySelectionRelevo),
              )
            ]),

            const SizedBox(
              height: 30,
            ),
            DropdownButtonFormField(
                decoration: const InputDecoration(
                  filled: true,
                  labelText: 'Uso',
                ),
                hint: const Text("Uso"),
                items: uso.map((item) {
                  return DropdownMenuItem(
                    child: Text(item),
                    value: item.toString(),
                  );
                }).toList(),
                onChanged: (newVala) {
                  setState(() {
                    _mySelectionUso = newVala;
                  });
                },
                value: _mySelectionUso),

            const SizedBox(
              height: 30,
            ),

            Row(children: [
              Expanded(
                child: DropdownButtonFormField(
                    decoration: const InputDecoration(
                      filled: true,
                      labelText: 'Muro e Passeio',
                    ),
                    hint: const Text("Muro"),
                    items: muro.map((item) {
                      return DropdownMenuItem(
                        child: Text(item),
                        value: item.toString(),
                      );
                    }).toList(),
                    onChanged: (newVala) {
                      setState(() {
                        _mySelectionMuro = newVala;
                      });
                    },
                    value: _mySelectionMuro),
              ),
              SizedBox(
                width: 20,
              ),
            ]),

            const SizedBox(
              height: 30,
            ),

            DropdownButtonFormField(
                decoration: const InputDecoration(
                  filled: true,
                  labelText: 'Conservação',
                ),
                hint: const Text("Conservação"),
                items: conservacao.map((item) {
                  return DropdownMenuItem(
                    child: Text(item),
                    value: item.toString(),
                  );
                }).toList(),
                onChanged: (newVala) {
                  setState(() {
                    _mySelectionConservacao = newVala;
                  });
                },
                value: _mySelectionConservacao),

            const SizedBox(
              height: 30,
            ),

// 5 linha revestimento
            DropdownButtonFormField(
                decoration: const InputDecoration(
                  filled: true,
                  labelText: 'Revestimento',
                ),
                hint: const Text("Revestimento"),
                items: revestimento.map((item) {
                  return DropdownMenuItem(
                    child: Text(item),
                    value: item.toString(),
                  );
                }).toList(),
                onChanged: (newVala) {
                  setState(() {
                    _mySelectionRevestimento = newVala;
                  });
                },
                value: _mySelectionRevestimento),

            const SizedBox(
              height: 30,
            ),

            DropdownButtonFormField(
                decoration: const InputDecoration(
                  filled: true,
                  labelText: 'Estrutura de Construção',
                ),
                hint: const Text("Estrutura de Construção"),
                items: estrutura.map((item) {
                  return DropdownMenuItem(
                    child: Text(item),
                    value: item.toString(),
                  );
                }).toList(),
                onChanged: (newVala) {
                  setState(() {
                    _mySelectionEstrutura = newVala;
                  });
                },
                value: _mySelectionEstrutura),

            const SizedBox(
              height: 30,
            ),

//coberrtura
            DropdownButtonFormField(
                decoration: const InputDecoration(
                  filled: true,
                  labelText: 'Cobertura',
                ),
                hint: const Text("Cobertura"),
                items: cobertura.map((item) {
                  return DropdownMenuItem(
                    child: Text(item),
                    value: item.toString(),
                  );
                }).toList(),
                onChanged: (newVala) {
                  setState(() {
                    _mySelectionCobertura = newVala;
                  });
                },
                value: _mySelectionCobertura),

            const SizedBox(
              height: 30,
            ),

            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo[500],
                  fixedSize: const Size(150, 46),
                  textStyle: const TextStyle(fontSize: 15)),
              child: Text('Adicionar Unidade'),
            ),

            const SizedBox(
              height: 40,
            ),

            Center(
                child: ElevatedButton(
              onPressed: () async {
                if (id == null) {
                  await _addData();
                }
                if (id != null) {
                  await _updateData(id);
                }

                _tRequerente.text = "";
                _tEndereco.text = "";
//hide bottom sheet
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Text(id == null ? "Enviar" : "Atualizar",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    )),
              ),
            )),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffefeceaf4),
      appBar: AppBar(
          centerTitle: true,
          title: Text("BCI"),
          backgroundColor: Colors.deepPurple[800]),
      drawer: DrawerList(),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: _allData.length,
              itemBuilder: (context, index) => Card(
                margin: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    Row(children: [
                      Container(
                     height: 245,
                      child: Image.asset('assets/img/maps.jpg')),
                      ],),
                    ListTile(
                      title: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Text(
                          _allData[index]['att'],
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      subtitle: Text(_allData[index]['requerente']),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () {
                              showBottomSheet(_allData[index]['id']);
                            },
                            icon: const Icon(
                              Icons.edit,
                              color: Colors.indigo,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              _deleteData(_allData[index]['id']);
                            },
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.redAccent,
                            ),
                          ),
                        ],
                      ),
                    ),
                    
                  ],
                ),
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showBottomSheet(null),
        child: const Icon(Icons.add),
      ),
    );
  }
}
