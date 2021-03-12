//
//  main.swift
//  lesson2
//
//  Created by Илья Слепцов on 08.03.2021.
//
// Евгений, добрый день! Сам сделал первые 3 задания, остальные подсматривал у Вас. В процессе выполнения 4 задания пришлось свой код корректировать, т.к. Хкод выдавал ошибки то с Int, то еще с чем-то.
// В 5 задании пытался убрать строку с Decimal, т.к. писал задание для 50 чисел, но Хкод ругается, что не находит FibonacciType, подскажите как исправить эту ошибку? нужно назначить переменную FibonacciType?

import Foundation


// 1. Написать функцию, которая определяет, четное число или нет.

func isEven(number: Int) -> Bool {
    return number % 2 == 0
}

// 2. Написать функцию, которая определяет, делится ли число без остатка на 3.

func divideBy3(_ number: Int, divideBy divider: Int) -> Bool {
    return number % divider == 0
}

// 3. Создать возрастающий массив из 100 чисел.

var someArray = [Int]()

for i in 1...100 {
    someArray.append(i)
}

// 4. Удалить из этого массива все четные числа и все числа, которые не делятся на 3.

for item in someArray {
    if isEven (number: item) || !divideBy3(item, divideBy: 3) {
        if let index = someArray.firstIndex(of: item) {
            someArray.remove(at: index)
        }
    }
}

print(someArray)

// 5. *Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 50 элементов

typealias FibonacciType = Decimal

var fibonacci = [FibonacciType]()

func createNextFibonacciNumber(for array: inout [FibonacciType]) {
    switch array.count {
    case 0, 1:
        array.append(1)
    default:
        let penultimateNumber = array[array.count - 2]
        let lastNumber = array[array.count - 1]
        array.append(penultimateNumber + lastNumber)
    }
}

for _ in 1...50 {
    createNextFibonacciNumber(for: &fibonacci)
}

print(fibonacci)

// 6. *Заполнить массив из 100 элементов различными простыми числами

func createPrimeNumbersArray() -> [Int] {
    var primeNumbersArray = [2]
    var currentNumber = 3
    
    while primeNumbersArray.count < 100 {
        var isPrimeNumber = true
        for checkNumber in 2...currentNumber - 1 {
            if currentNumber % checkNumber == 0 {
                isPrimeNumber = false
                break
            }
        }
        if isPrimeNumber {
            primeNumbersArray.append(currentNumber)
        }
        currentNumber += 1
    }
    return primeNumbersArray
}
let primeNumbersArray = createPrimeNumbersArray()

print(primeNumbersArray)
