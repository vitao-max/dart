import 'dart:io';

main() {

print("Informe seu cpf: ");
  String cpfTexto = stdin.readLineSync()!; // informe o cpf em texto 

  
  cpfTexto = cpfTexto.replaceAll(".", "").replaceAll("-", ""); //tira os caractericos do cpf 

 
  List<int> cpfNumeros = cpfTexto.split('').map(int.parse).toList(); //convert o cpf de texto pra numeros 

    if (cpfNumeros.length != 11) {
      print("O CPF informado é invalido!");
      return; // inpede do codigo continuar é tipo o bleak do c# 
    }
 
  List<int> mult1 = [1,2,3,4,5,6,7,8,9]; // numeros da primeira multiplicação
  int soma1 = 0; //pra samar o primeiro resultado da multiplicação 
  for (int i = 0; i < 9; i++) { 
    soma1 += cpfNumeros[i] * mult1[i]; // multiplicar e somar pra saber o primeiro numero verificador 
  }

  int resto1 = soma1 % 11; // pra saber o digito verificador 

 if (resto1==10){ //se o numero verificador for igual a 10 ele é substiduido por 0 
  resto1=0;
 }
 cpfNumeros.add(resto1); //adiciona o numero dicorperto 
  

 
  List<int> mult2 = [0,1,2,3,4,5,6,7,8,9]; //numeros pra segunda multiplicação 
  int soma2 = 0;
  for (int i = 0; i < 10; i++) {
    soma2 += cpfNumeros[i] * mult2[i]; // multiplicar e somar pra saber o segundo numero verificador 
  }

  int resto2 = soma2 % 11;
  if (resto2==10){ //se o numero verificador for igual a 10 ele é substiduido por 0 
    resto2=0;
  }
  

 
  if (resto1== cpfNumeros[9] && resto2 == cpfNumeros[10]) { //se o resto1 for igual ao numero no indice9 e p resto2 for ingual ao indice 10 quer dizer que o cpf é valido...
    print("O CPF informado é valido!");
  } else { //caso alcntrario é invalido
    print("O CPF informado é invalido!");
  }

}