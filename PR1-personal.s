#/**
# * Universidad de La Laguna
# * Escuela Superior de Ingeniería y Tecnología
# * Grado en Ingeniería Informática
# * Principio de Computadores 2023-2024 
# *
# * @file PR1.cpp
# * @author Sergio Rosales Calzadilla alu010635590@ull.edu.es
# * @date Feb 17 2024
# * @brief The program makes the number e with some tolerance by the user
# * @bug There are no known bugs
#*/

##include <iostream>
##include <iomanip>

#using namespace std;

#int main() {
#  cout << "PR1: Principio de Computadores." << endl;
# 
#  cout << "Introduzca maximo error permitido: ";
#  double tolerance{0.0};
#  cin >> tolerance;
#  while (tolerance < 0.00001 || tolerance >= 1) {
#    cout << "Error: el dato introducido debe cumplir: 0.00001 <= dato < 1" << endl;
#    tolerance = 0.0;
#    cout << "Introduzca maximo error permitido: ";
#    cin >> tolerance;
#  }
#  double aproximacion_numero_e{1.0}; // 1/0!
#  int numero_terminos{1}; 
#  double factorial{1.0}; // 0!
#  while (factorial > tolerance) {
#    factorial /= numero_terminos++;
#    aproximacion_numero_e += factorial;
#  }
#  cout << "Numero e: " << fixed << setprecision(17) << aproximacion_numero_e << endl;
#  cout << "Numero de terminos: " << numero_terminos << endl;
#  cout << "Fin del programa." << endl;
#  return 0;
#}

# Asignacion de variables a registros
# tolerance ->  $f20
# numero_terminos    ->  $f22
# factorial  ->  $f24
# aproximacion_numero_e -> $f26

    .data

titulo:		.asciiz "\nPR1: Principio de computadores.\n"
pet:		.asciiz "\nIntroduzca maximo error permitido: "
caderr:		.asciiz "\nError: el dato introducido debe cumplir 0.00001 <= dato < 1\n"
cade:		.asciiz "\nNumero e: "
cadnt:		.asciiz "\nNumero de terminos: "
cadfin:		.asciiz "\nPR1: Fin del programa.\n"
numero1:        .double 1.0

  .text
#int main() {
main:
#  cout << "PR1: Principio de Computadores." << endl;
    li $v0,4
    la $a0,titulo
    syscall
#  cout << "Introduzca maximo error permitido: ";
    li $v0,4
    la $a0,pet
    syscall
#  double tolerance{0.0};
#  cin >> tolerance;
while_revision:
    li $v0,7
    syscall
    mov.d $f20,$f0
#  while (tolerance < 0.00001 || tolerance >= 1) {
while:
    li.d $f4,0.00001
    l.d $f6,numero1
    c.lt.d $f20,$f4
    bc1t while_then
    c.lt.d $f20,$f6
    bc1f while_then
    b while_fin
while_then:
#    cout << "Error: el dato introducido debe cumplir: 0.00001 <= dato < 1" << endl;
    li $v0,4
    la $a0,caderr
    syscall
#    tolerance = 0.0;
    li.d $f20,0.0
#    cout << "Introduzca maximo error permitido: ";
    li $v0,4
    la $a0,pet
    syscall
#    cin >> tolerance;
    b while_revision
#  }
while_fin:
#  double aproximacion_numero_e{1.0}; // 1/0!
    l.d $f26,numero1
#  int numero_terminos{1}; 
    l.d $f22,numero1 # pese a que sea un numero entero, lo cargaremos en double
#  double factorial{1.0}; // 0!
    l.d $f24,numero1
#  while (factorial > tolerance) {
while_generar_e:
#    factorial /= numero_terminos++;
    div.d $f24,$f24,$f22
    l.d $f8,numero1
    add.d $f22,$f22,$f8
#    aproximacion_numero_e += factorial;
    add.d $f26,$f26,$f24
    c.lt.d $f24,$f20
    bc1f while_generar_e
#  }
#  cout << "Numero e: " << fixed << setprecision(17) << aproximacion_numero_e << endl;
    li $v0,4
    la $a0,cade
    syscall
    li $v0,3
    mov.d $f12,$f26
    syscall
#  cout << "Numero de terminos: " << numero_terminos << endl;
    li $v0,4
    la $a0,cadnt
    syscall
    cvt.w.d $f10,$f22
    mfc1 $s0,$f10
    li $v0,1
    move $a0,$s0
    syscall
#  cout << "Fin del programa." << endl;
    li $v0,4
    la $a0,cadfin
    syscall
#   return 0;
    li$v0,10
    syscall
#}
