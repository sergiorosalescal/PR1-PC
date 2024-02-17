##/**
## * Universidad de La Laguna
## * Escuela Superior de Ingeniería y Tecnología
## * Grado en Ingeniería Informática
## * Principio de Computadores 2023-2024 
## *
## * @file PR1.cpp
## * @author Sergio Rosales Calzadilla alu010635590@ull.edu.es
## * @date Feb 17 2024
## * @brief The program makes the number e with some tolerance by the user
## * @bug There are no known bugs
##*/

##include <iomanip>
##include <iostream>

#int main(int argc, char *argv[])
#{
#    double error = 0;

#    double e = 1; // 1/0!
#    double fact = 1; // 0!
#    double numterminos = 1;
#    double ultimo_termino = 1; ; // 1/0!

#    std::cout << "\nPR1: Principio de computadores.\n";
#    do {
#        std::cout << "\nIntroduzca maximo error permitido: ";
#        std::cin >> error;
#        if (!(error >= 0.00001 && error < 1))
#            std::cout << "\nError: el dato introducido debe cumplir 0.00001 <= dato < 1\n";
#        else break;
#    } while (true);

#    while (ultimo_termino >= error) {
#        fact *= numterminos;
#        ultimo_termino = 1/fact;
#        e += ultimo_termino;
#        numterminos++;
#    }
#    std::cout <<  "\nNumero e: ";
#    std::cout << std::fixed << std::setprecision(17) << e;
#    std::cout << "\nNumero de terminos: " << int(numterminos);
#    std::cout << "\nPR1: Fin del programa.\n";
#    return 0;
#}

# Asignacion de variables a registros
# error ->  $f20
# e     ->  $f22
# fact  ->  $f24
# numterminos -> $f26
# ultimo_termino -> $f28

	.data

titulo:		.asciiz "\nPR1: Principio de computadores.\n"
pet:		.asciiz "\nIntroduzca maximo error permitido: "
caderr:		.asciiz "\nError: el dato introducido debe cumplir 0.00001 <= dato < 1\n"
cade:		.asciiz "\nNumero e: "
cadnt:		.asciiz "\nNumero de terminos: "
cadfin:		.asciiz "\nPR1: Fin del programa.\n"
numero1:        .double 1.0

  .text
main:
#    std::cout << "\nPR1: Principio de computadores.\n";
    li $v0,4
    la $a0,titulo
    syscall
#    do {
do_while:
#        std::cout << "\nIntroduzca maximo error permitido: ";
    li $v0,4
    la $a0,pet
    syscall
#        std::cin >> error;
    li $v0,7
    syscall
    mov.d $f20,$f0
#        if (!(error >= 0.00001 && error < 1))
if_do_while:
    li.d $f4,0.00001
    li.d $f6,1.0 
    c.lt.d $f20,$f4
    bc1t if_do_while_then
    c.lt.d $f20,$f6
    bc1f if_do_while_then
    b else_do_while
if_do_while_then:
#        std::cout << "\nError: el dato introducido debe cumplir 0.00001 <= dato < 1\n";
    li $v0,4
    la $a0,caderr
    syscall
    b do_while_condicion
#        else break;
else_do_while:
    b do_while_fin
#    } while (true);
do_while_condicion:
    b do_while
do_while_fin:
#    while (ultimo_termino >= error) {
    li.d $f22,1.0
    li.d $f24,1.0
    li.d $f26,1.0
    li.d $f28,1.0
while_condicion:
    c.lt.d $f28,$f20
    bc1t while_fin
while_then:
#        fact *= numterminos;
    mul.d $f24,$f24,$f26
#        ultimo_termino = 1/fact;
    l.d $f30,numero1
    div.d $f28,$f30,$f24
#        e += ultimo_termino;
    add.d $f22,$f22,$f28
#        numterminos++;
    add.d $f26,$f26,$f30
#    }
    b while_condicion
while_fin:
#    std::cout <<  "\nNumero e: ";
    li $v0,4
    la $a0,cade
    syscall
#    std::cout << std::fixed << std::setprecision(17) << e;
    li $v0,3
    mov.d $f12,$f22
    syscall
#    std::cout << "\nNumero de terminos: " << int(numterminos);
    li $v0,4
    la $a0,cadnt
    syscall
    cvt.w.d $f10,$f26
    mfc1 $s0,$f10
    li $v0,1
    move $a0,$s0
    syscall
#    std::cout << "\nPR1: Fin del programa.\n";
    li $v0,4
    la $a0,cadfin
    syscall
#    return 0;
    li$v0,10
    syscall
#    std::cout << "\nPR1: Fin del programa.\n";
    li $v0,4
    la $a0,cadfin
    syscall
#    return 0;
    li$v0,10
    syscall




