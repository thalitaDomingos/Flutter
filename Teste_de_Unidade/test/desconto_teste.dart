import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:projeto_dependencias/main.dart';
import 'package:projeto_dependencias/Desconto.dart';

void main() {
  const valorSemDesconto = 150.0;

  test('Deve calcular desconto corretamente utilizando porcentagem', () {
    var desconto = 10.0;
    var valorComDesconto = 135.0;
    expect(
        calcularDesconto(valorSemDesconto, desconto, true), valorComDesconto);
  });
}
