//
//  main.swift
//  L1_IlyaSleptsov
//
//  Created by Илья Слепцов on 04.03.2021.
//
import Foundation

// 1. решите квадратное уравнение

var a = 5.0
var b = -10.0
var c = 2.0
var x1 = 0.0
var x2 = 0.0

var d = pow(b, 2)-4*a*c

if (d>0) {
    x1 = (-b+sqrt(d))/(2*a)
    x2 = (-b-sqrt(d))/(2*a)
    print("x1 = \(x1); x2 = \(x2)")
} else if (d==0) {
    x1 = (-b+sqrt(d))/(2*a)
    print("x1 = x2 = \(x1)")
} else {
    print("корней нет")
}

// 2. Даны катеты прямоугольного треугольника. Найти площадь, периметр и гипотенузу треугольника.

var e = 3.0
var f = 4.0
var g = sqrt(pow(e, 2)+pow(f, 2))
var S = (e*f)/2
var P = sqrt(pow(e, 2)+pow(f, 2))+e+f
print("Площадь = \(S); Периметр = \(P); Гипотенуза = \(g)")

// 3. *Пользователь вводит сумму вклада в банк и годовой процент. Найти сумму вклада через                             5 лет.

var sum = 50000.0
var perc = 0.09

var sum5years = sum + 5 * sum * perc
print("Сумма вклада через 5 лет = \(sum5years)")
