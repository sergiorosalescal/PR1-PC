/**
 * Universidad de La Laguna
 * Escuela Superior de Ingeniería y Tecnología
 * Grado en Ingeniería Informática
 * Principio de Computadores 2023-2024 
 *
 * @file PR1.cpp
 * @author Sergio Rosales Calzadilla alu010635590@ull.edu.es
 * @date Feb 17 2024
 * @brief The program makes the number e with some tolerance by the user
 * @bug There are no known bugs
*/

#include <iostream> 
#include <iomanip>

using namespace std;

double Factorial(int numero_factorizar) {
  int numero_factorizado{1};
  for (int contador{numero_factorizar}; contador > 0; --contador) {
    numero_factorizado *= contador;
  }
  return numero_factorizado;
}


int main() {
  cout << "PR1: Principio de Computadores." << endl;
 
  cout << "Introduzca maximo error permitido: ";
  double tolerance{0.0};
  cin >> tolerance;
  while (tolerance < 0.00001 || tolerance >= 1) {
    cout << "Error: el dato introducido debe cumplir: 0.00001 <= dato < 1" << endl;
    tolerance = 0.0;
    cout << "Introduzca maximo error permitido: ";
    cin >> tolerance;
  }
  double aproximacion_numero_e{1.0}; // 1/0!
  int numero_terminos{1}; 
  double factorial{1.0}; // 0!
  while (factorial > tolerance) {
    factorial /= numero_terminos++;
    aproximacion_numero_e += factorial;
  }
  cout << "Numero e: " << fixed << setprecision(17) << aproximacion_numero_e << endl;
  cout << "Numero de terminos: " << numero_terminos << endl;
  cout << "Fin del programa." << endl;
  return 0;
}

