import 'package:bci/screen/utils/alert.dart';
import 'package:bci/screen/utils/drawer_list.dart';
import 'package:bci/screen/utils/nav.dart';
import 'package:location/location.dart';
import 'package:flutter/material.dart';
import 'package:bci/screen/api_response.dart';
import 'package:bci/screen/home_page.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';

class NovoFormularioPage extends StatefulWidget {
  const NovoFormularioPage({Key? key}) : super(key: key);

  @override
  State<NovoFormularioPage> createState() => NovoFormularioPageState();
}

class NovoFormularioPageState extends State<NovoFormularioPage> {
  String uni = '   1';


  final _formKey = GlobalKey<FormState>();
  final _tRequerente = TextEditingController();
  final _tEndereco = TextEditingController();
  final _tBairro = TextEditingController();
  final _tTelefone = TextEditingController();
  final _tATTold = TextEditingController();
  final _tAtt = TextEditingController();
  final _tATCold = TextEditingController();
  final _tProcessnumber = TextEditingController();
  final _tContribuinte = TextEditingController();
  final _tProprietario =TextEditingController();
  final _tLote = TextEditingController();
  final _tUso = TextEditingController();
  final _tConservacao = TextEditingController();   
  final _tRevestimento = TextEditingController();
  final _tCobertura = TextEditingController();
  final _tEstrutura = TextEditingController();
  final _tComplemento = TextEditingController();
  final _tUnidades    = TextEditingController();



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

  dynamic _mySelectionLote;
  dynamic _mySelectionNumUnid;
  dynamic _mySelectionRelevo;
  dynamic _mySelectionMuro;
  dynamic _mySelectionTipologia;
  dynamic _mySelectionUso;
  dynamic _mySelectionConservacao;
  dynamic _mySelectionRevestimento;
  dynamic _mySelectionCobertura;
  dynamic _mySelectionEstrutura;

  List<bool> isSelected = List.generate(3, (_) => false);
  // List<bool> isSelected = [true, false, false];
  bool _showProgress = false;
  bool _isPressed = false;

  @override
  void initState() {
    super.initState();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _nbody(),
    );
  }

  _nbody() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 30, 30, 10),
      child: Container(
        child: _form(),
      ),
    );
  }

  _form() {
    return Form(
      key: _formKey,
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[
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
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
              ),
              Text(
                'PREFEITURA DA CIDADE DE MESQUITA',
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
              ),
              Text(
                'SECRETARIA MUNICIPAL DA FAZENDA',
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
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
                controller: _tATTold,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: InputDecoration(
                    hintText: 'ATT Anterior',
                    labelText: 'ATT Anterior',
                    icon: Icon(Icons.queue_sharp)),
              ),
              TextFormField(
                controller: _tATCold,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: InputDecoration(
                    hintText: 'ATC Anterior',
                    labelText: 'ATC Anterior',
                    icon: Icon(Icons.queue_sharp)),
              ),
            ],
          ),
          // TextFormField(), PEGAR A LAT E A LONG AQUI

          SizedBox(height: 30),
          Column(
            children: [
              Text(
                'Boletim de Cadastro Imobiliário',
                textAlign: TextAlign.left,
                overflow: TextOverflow.ellipsis,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
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
            
              validator: (value) {
                if (value == null) {
                  return 'Nº Unidades';
                }
              },
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
         

        



          Column(
            children: [
              Text("unidade" + uni,
               textAlign: TextAlign.left,
              ),

              TextFormField(
                controller: _tAtt,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: InputDecoration(
                  hintText: 'ATT',
                  labelText: 'ATT',
                  icon: Icon(Icons.summarize_outlined),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
//primeira linha lote e relevo
              Row(children: [
                Expanded(
                  child: DropdownButtonFormField(
                      validator: (value) {
                        if (value == null) {
                          return 'Lote';
                        }
                      },
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
                      validator: (value) {
                        if (value == null) {
                          return 'Relevo';
                        }
                      },
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

// segunda linha uso
              DropdownButtonFormField(
                  validator: (value) {
                    if (value == null) {
                      return 'Uso';
                    }
                  },
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

//3 linha muro e passeio e tipologia
              Row(children: [
                Expanded(
                  child: DropdownButtonFormField(
                      validator: (value) {
                        if (value == null) {
                          return 'Muro e Passeio';
                        }
                      },
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
                Expanded(
                  child: DropdownButtonFormField(
                      validator: (value) {
                        if (value == null) {
                          return 'Tipologia';
                        }
                      },
                      decoration: const InputDecoration(
                        filled: true,
                        labelText: 'Tipologia',
                      ),
                      hint: const Text("Tipologia"),
                      items: tipologia.map((item) {
                        return DropdownMenuItem(
                          child: Text(item),
                          value: item.toString(),
                        );
                      }).toList(),
                      onChanged: (newVala) {
                        setState(() {
                          _mySelectionTipologia = newVala;
                        });
                      },
                      value: _mySelectionTipologia),
                )
              ]),

              const SizedBox(
                height: 30,
              ),
//4 linha conservacao
              DropdownButtonFormField(
                  validator: (value) {
                    if (value == null) {
                      return 'Conservação';
                    }
                  },
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
                  validator: (value) {
                    if (value == null) {
                      return 'Revestimento';
                    }
                  },
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

//estrutura de construcao
              DropdownButtonFormField(
                  validator: (value) {
                    if (value == null) {
                      return 'Estrutura de Construção';
                    }
                  },
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
                  validator: (value) {
                    if (value == null) {
                      return 'Cobertura';
                    }
                  },
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
            ],
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

          Container(
            height: 45,
            margin: const EdgeInsets.only(top: 20),
            width: MediaQuery.of(context).size.width / 1.2,
            // ignore: deprecated_member_use
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple[900],
                  fixedSize: const Size(240, 46),
                  textStyle: const TextStyle(fontSize: 22)),
              child: Text('Enviar'),
            ),
          )
        ],
      ),
    );
  }
}
