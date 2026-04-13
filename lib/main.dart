import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: Curriculo(),
  debugShowCheckedModeBanner: false,));
}

class Curriculo extends StatefulWidget {
  const Curriculo({super.key});

  @override
  State<Curriculo> createState() => _CurriculoState();
}

class Escolaridade extends StatelessWidget {
  final List<String> escolaridades;
  final Function(int)? onRemove;

  Escolaridade({super.key, List<String>? escolaridades, this.onRemove})
      : escolaridades = escolaridades ?? [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Escolaridade'),
      ),
      body: escolaridades.isEmpty
          ? Center(child: Text('Nenhuma escolaridade adicionada ainda.'))
          : ListView.builder(
              itemCount: escolaridades.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  key: Key(escolaridades[index] + index.toString()),
                  onDismissed: (direction) {
                    if (onRemove != null) {
                      onRemove!(index);
                    }
                  },
                  background: Container(
                    color: Colors.red,
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.only(right: 20.0),
                    child: Icon(Icons.delete, color: Colors.white),
                  ),
                  child: ListTile(
                    title: Text(escolaridades[index]),
                  ),
                );
              },
            ),
    );
  }
}

class Projetos extends StatelessWidget {
  final List<String> projetos;
  final Function(int)? onRemove;

  Projetos({super.key, List<String>? projetos, this.onRemove})
      : projetos = projetos ?? [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Projetos'),
      ),
      body: projetos.isEmpty
          ? Center(child: Text('Nenhum projeto adicionado ainda.'))
          : ListView.builder(
              itemCount: projetos.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  key: Key(projetos[index] + index.toString()),
                  onDismissed: (direction) {
                    if (onRemove != null) {
                      onRemove!(index);
                    }
                  },
                  background: Container(
                    color: Colors.red,
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.only(right: 20.0),
                    child: Icon(Icons.delete, color: Colors.white),
                  ),
                  child: ListTile(
                    title: Text(projetos[index]),
                  ),
                );
              },
            ),
    );
  }
}

class Recomendacao extends StatelessWidget {
  final List<String> recomendacoes;
  final Function(int)? onRemove;

  Recomendacao({super.key, List<String>? recomendacoes, this.onRemove})
      : recomendacoes = recomendacoes ?? [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recomendação'),
      ),
      body: recomendacoes.isEmpty
          ? Center(child: Text('Nenhuma recomendação adicionada ainda.'))
          : ListView.builder(
              itemCount: recomendacoes.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  key: Key(recomendacoes[index] + index.toString()),
                  onDismissed: (direction) {
                    if (onRemove != null) {
                      onRemove!(index);
                    }
                  },
                  background: Container(
                    color: Colors.red,
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.only(right: 20.0),
                    child: Icon(Icons.delete, color: Colors.white),
                  ),
                  child: ListTile(
                    title: Text(recomendacoes[index]),
                  ),
                );
              },
            ),
    );
  }
}

class VisualizarCurriculo extends StatelessWidget {
  final List<String> escolaridades;
  final List<String> projetos;
  final List<String> recomendacoes;

  VisualizarCurriculo({
    super.key,
    List<String>? escolaridades,
    List<String>? projetos,
    List<String>? recomendacoes,
  })  : escolaridades = escolaridades ?? [],
        projetos = projetos ?? [],
        recomendacoes = recomendacoes ?? [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Visualizar Currículo'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('images/eu.jpeg'),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Thiago de Andrade Balbinot',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(height: 32.0),
            Text(
              'Escolaridade:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            escolaridades.isEmpty
                ? Text('Nenhuma escolaridade adicionada.')
                : Column(
                    children: escolaridades
                        .map((item) => Text('• $item'))
                        .toList(),
                  ),
            SizedBox(height: 32.0),
            Text(
              'Projetos:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            projetos.isEmpty
                ? Text('Nenhum projeto adicionado.')
                : Column(
                    children: projetos
                        .map((item) => Text('• $item'))
                        .toList(),
                  ),
            SizedBox(height: 32.0),
            Text(
              'Recomendações:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            recomendacoes.isEmpty
                ? Text('Nenhuma recomendação adicionada.')
                : Column(
                    children: recomendacoes
                        .map((item) => Text('• $item'))
                        .toList(),
                  ),
          ],
        ),
      ),
    );
  }
}

class _CurriculoState extends State<Curriculo> {
  List<String> escolaridades = [];
  List<String> projetos = [];
  List<String> recomendacoes = [];

  void _adicionarEscolaridade(String nova) {
    setState(() {
      escolaridades.add(nova);
    });
  }

  void _adicionarProjeto(String nova) {
    setState(() {
      projetos.add(nova);
    });
  }

  void _adicionarRecomendacao(String nova) {
    setState(() {
      recomendacoes.add(nova);
    });
  }

  void _mostrarDialogoAdicionar(BuildContext context) {
    String? selectedTopic;
    TextEditingController controller = TextEditingController();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) => AlertDialog(
            title: Text('Adicionar Informação'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                DropdownButton<String>(
                  hint: Text('Selecione o tópico'),
                  value: selectedTopic,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedTopic = newValue;
                    });
                  },
                  items: <String>['Escolaridade', 'Projetos', 'Recomendação']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                TextField(
                  controller: controller,
                  decoration: InputDecoration(hintText: 'Digite a informação'),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Cancelar'),
              ),
              TextButton(
                onPressed: () {
                  if (selectedTopic != null && controller.text.isNotEmpty) {
                    if (selectedTopic == 'Escolaridade') {
                      _adicionarEscolaridade(controller.text);
                    } else if (selectedTopic == 'Projetos') {
                      _adicionarProjeto(controller.text);
                    } else if (selectedTopic == 'Recomendação') {
                      _adicionarRecomendacao(controller.text);
                    }
                    Navigator.of(context).pop();
                  }
                },
                child: Text('Adicionar'),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              _mostrarDialogoAdicionar(context);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('images/eu.jpeg'),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Thiago de Andrade Balbinot',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Escolaridade(escolaridades: escolaridades, onRemove: (index) => setState(() => escolaridades.removeAt(index)))),
                );
              },
              child: Text('Escolaridade'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Projetos(projetos: projetos, onRemove: (index) => setState(() => projetos.removeAt(index)))),
                );
              },
              child: Text('Projetos'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Recomendacao(recomendacoes: recomendacoes, onRemove: (index) => setState(() => recomendacoes.removeAt(index)))),
                );
              },
              child: Text('Recomendação'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => VisualizarCurriculo(
                    escolaridades: escolaridades,
                    projetos: projetos,
                    recomendacoes: recomendacoes,
                  )),
                );
              },
              child: Text('Visualizar Currículo'),
            ),
          ]
        ),
      ),
    );
  }
}