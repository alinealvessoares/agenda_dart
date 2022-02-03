abstract class Contato {
  String _nome;
  String _telefone;
  String _data;

  Contato(this._nome, this._telefone, this._data);

  String get nome => _nome;

  set nome(String nome) {
    _nome = nome;
  }

  String get telefone => _telefone;

  set telefone(String telefone) {
    _telefone = telefone;
  }

  String get data => _data;

  set data(String data) {
    _data = data;
  }
}

class ContatoProfissional extends Contato {
  String _empresa;
  String get empresa => _empresa;

  set empresa(String empresa) {
    _empresa = empresa;
  }

  ContatoProfissional(
      this._empresa, String _nome, String _telefone, String _data) : super(_nome, _telefone, _data);

  String toString() {
    return (' Empresa: $empresa,Nome: $nome, Telefone: $telefone, Data: $data');
  }
}

class ContatoPessoal extends Contato {
  Endereco _endereco;

  Endereco get endereco => _endereco;
  

  set endereco(Endereco endereco) {
    _endereco = endereco;
  }

  ContatoPessoal(this._endereco, String _nome, String _telefone, String _data) : super(_nome, _telefone, _data);
  
  String toString() {
    return (' Endereço: $endereco,Nome: $nome, Telefone: $telefone, Data: $data');
  }
}

class Endereco {
  String _rua;
  String _bairro;
  int _numero;

  String get rua => _rua;
  

  set rua(String rua) {
    _rua = rua;
  }

  String get bairro =>_bairro;
  
  set bairro(String bairro) {
    _bairro = bairro;
  }

  int get numero => _numero;
  
  set numero(int numero) {
    _numero = numero;
  }

  Endereco(this._rua, this._bairro, this._numero);

  String toString() {
    return 'Rua: $rua, Bairro: $bairro, N°: $numero ';
  }
}

class Agenda {
  var contatos = <Contato>[];

  void adicionar(Contato c) {
    contatos.add(c);
  }

  void remover(Contato c) {
    print("Remover contato:" + c.toString());
    contatos.remove(c);
    print ('\n');
  }

  bool pesquisar(Contato c) {
    print("Pesquisar contato: " + c.toString() + "\n");
    return contatos.contains(c);
  }

  void imprimirContatos() {
    print('\n Lista de Contatos:');
    if (contatos.isEmpty) {
      print(' Nenhum contato adicionado.');
    } else {
        for (var i = 0; i < contatos.length; i++) {
        Contato c = contatos[i];
        print("Contato " + (i + 1).toString() + ':' );
        print(c);
      }
    }
  }
}

void main() {
  var agenda = Agenda();

  var contato1 = new ContatoProfissional ("Marisa", "André", "8899658741", "10/02/2021.");
  var contato2 = new ContatoPessoal (Endereco ("Rua um", "Pirajá", 542),"Ana", "8899253684", "05/10/2021.");
  var contato3 = new ContatoProfissional ("Casas Bahia", "Lucia", "8894567823", "07/08/2021.");
  var contato4 = new ContatoPessoal (Endereco ("Rua dois ", "Maracanaú", 405), "Márcia", "8899325896", "22/10/2021.");


  agenda.adicionar(contato1);
  agenda.adicionar(contato2);
  agenda.adicionar(contato3);
  agenda.adicionar(contato4);

  agenda.imprimirContatos();
  
  agenda.remover(contato2);
   
 
  var pesquisa = agenda.pesquisar(contato2);
  if (pesquisa) {
    print("Contato: " + contato2.toString() + " \n Situação: Encontrado\n");
  } else {
    print("Contato: " + contato2.toString() + " Não Encontrado\n");
  }

  pesquisa = agenda.pesquisar(contato1);
  if (pesquisa) {
    print("Contato: " + contato1.nome + " \n  Situação : Encontrado\n");
  } else {
    print("Contato: " + contato1.nome + " Não Encontrado\n");
  }
}
