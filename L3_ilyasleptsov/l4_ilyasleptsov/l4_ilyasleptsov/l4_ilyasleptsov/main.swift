//
//  main.swift
//  l4_ilyasleptsov
//
//  Created by Илья Слепцов on 19.03.2021.
//

import Foundation

// 1. Описать класс Car c общими свойствами автомобилей и пустым методом действия по аналогии с прошлым заданием.

// 2. Описать пару его наследников trunkCar и sportСar. Подумать, какими отличительными свойствами обладают эти автомобили. Описать в каждом наследнике специфичные для него свойства.

// 3. Взять из прошлого урока enum с действиями над автомобилем. Подумать, какие особенные действия имеет trunkCar, а какие – sportCar. Добавить эти действия в перечисление.

// 4. В каждом подклассе переопределить метод действия с автомобилем в соответствии с его классом.

// 5. Создать несколько объектов каждого класса. Применить к ним различные действия.

// 6. Вывести значения свойств экземпляров в консоль.


//MARK: - Enums
enum engineStatus: String {
    case start = "заведен", stop = "заглушен"
}

enum windowsStatus: String {
    case open = "открыты", close = "закрыты"
}

enum doorsStatus: String {
    case open = "открыты", close = "закрыты"
}

enum toning: String {
    case withToning = "с тонировкой", withoutToning = "без тонировки"
}

enum trunk: String {
    case withFridge = "морозильная камера", withoutFridge = "без морозильной камеры"
}

//MARK: - Car class

class Car {
    let carBrand: String
    let yearOfRelease: Int
    let trunkVolume: Double
    var engineStatus: engineStatus
    var windowsStatus: windowsStatus
    var doorsStatus: doorsStatus
    
    init(carBrand: String, yearOfRelease: Int, trunkVolume: Double, engineStatus: engineStatus, windowsStatus: windowsStatus, doorsStatus: doorsStatus) {
        self.carBrand = carBrand
        self.yearOfRelease = yearOfRelease
        self.trunkVolume = trunkVolume
        self.engineStatus = engineStatus
        self.windowsStatus = windowsStatus
        self.doorsStatus = doorsStatus
    }


//MARK: - Empty methods

    func changeEngineStatus(to: engineStatus) {}
    func changeWindowsStatus(to: windowsStatus) {}
    func changedoorsStatus(to: doorsStatus) {}
    
    func printEngineStatus() {
        print(self.engineStatus.rawValue)
    }
    func printWindowsStatus() {
        print(self.windowsStatus.rawValue)
    }
    func printDoorsStatus() {
        print(self.doorsStatus.rawValue)
    }
}


//MARK: - Successor class - SportCar

class SportCar: Car {
    
    var toning: toning
    
    init(carBrand: String, yearOfRelease: Int, trunkVolume: Double, engineStatus: engineStatus, windowsStatus: windowsStatus, doorsStatus: doorsStatus, toning: toning) {
    
    self.toning = toning
    
    super.init(carBrand: carBrand, yearOfRelease: yearOfRelease, trunkVolume: trunkVolume, engineStatus: engineStatus, windowsStatus: windowsStatus, doorsStatus: doorsStatus)
    }
    
    func changeToning(to: toning) {
        toning = to
    }
    
    override func changeEngineStatus(to: engineStatus) {
        engineStatus = to
    }
    
    override func changeWindowsStatus(to: windowsStatus) {
        windowsStatus = to
    }
    
    override func changedoorsStatus(to: doorsStatus) {
        doorsStatus = to
    }
    
    override func printEngineStatus() {
        super.printEngineStatus()
    }
    
    override func printWindowsStatus() {
        super.printWindowsStatus()
    }
    
    override func printDoorsStatus() {
        super.printDoorsStatus()
        print(self.toning.rawValue)
    }
}


//MARK: - Successor class - TrunkCar

class TrunkCar: Car {
    
    var trunk: trunk
    
    init(carBrand: String, yearOfRelease: Int, trunkVolume: Double, engineStatus: engineStatus, windowsStatus: windowsStatus, doorsStatus: doorsStatus, trunk: trunk) {
        
        self.trunk = trunk
        
        super.init(carBrand: carBrand, yearOfRelease: yearOfRelease, trunkVolume: trunkVolume, engineStatus: engineStatus, windowsStatus: windowsStatus, doorsStatus: doorsStatus)
    }
    
    func changeTrunkState(to: trunk) {
        trunk = to
    }
    
    override func changeEngineStatus(to: engineStatus) {
        engineStatus = to
    }
    
    override func changeWindowsStatus(to: windowsStatus) {
        windowsStatus = to
    }
    
    override func changedoorsStatus(to: doorsStatus) {
        doorsStatus = to
    }
    
    override func printEngineStatus() {
        super.printEngineStatus()
    }
    
    override func printWindowsStatus() {
        super.printWindowsStatus()
    }
    
    override func printDoorsStatus() {
        super.printDoorsStatus()
        print(self.trunk.rawValue)
    }
}


//MARK: - Make examples


var Skoda = SportCar (carBrand: "Skoda", yearOfRelease: 2018, trunkVolume: 400, engineStatus: .start, windowsStatus: .close, doorsStatus: .open, toning: .withToning)

var Subaru = SportCar (carBrand: "Subaru", yearOfRelease: 2019, trunkVolume: 500, engineStatus: .stop, windowsStatus: .open, doorsStatus: .close, toning: .withoutToning)

var BMW = SportCar (carBrand: "BMW", yearOfRelease: 2020, trunkVolume: 600, engineStatus: .start, windowsStatus: .close, doorsStatus: .close, toning: .withoutToning)

var Iveco = TrunkCar (carBrand: "Iveco", yearOfRelease: 2019, trunkVolume: 4000, engineStatus: .start, windowsStatus: .close, doorsStatus: .close, trunk: .withFridge)

var Volkswagen = TrunkCar(carBrand: "Volkswagen", yearOfRelease: 2020, trunkVolume: 5000, engineStatus: .stop, windowsStatus: .open, doorsStatus: .open, trunk: .withoutFridge)

var Renault = TrunkCar(carBrand: "Renault", yearOfRelease: 2021, trunkVolume: 6000, engineStatus: .start, windowsStatus: .close, doorsStatus: .close, trunk: .withoutFridge)



//MARK: - Output values


Skoda.changeEngineStatus(to: .stop)
Skoda.changeWindowsStatus(to: .open)
Skoda.changedoorsStatus(to: .close)
Skoda.changeToning(to: .withToning)
Skoda.printEngineStatus()
Skoda.printWindowsStatus()
Skoda.printDoorsStatus()

Subaru.changeEngineStatus(to: .start)
Subaru.changeWindowsStatus(to: .close)
Subaru.changedoorsStatus(to: .open)
Subaru.changeToning(to: .withToning)
Subaru.printEngineStatus()
Subaru.printWindowsStatus()
Subaru.printDoorsStatus()

BMW.changeEngineStatus(to: .stop)
BMW.changeWindowsStatus(to: .open)
BMW.changedoorsStatus(to: .open)
BMW.changeToning(to: .withToning)
BMW.printEngineStatus()
BMW.printWindowsStatus()
BMW.printDoorsStatus()

Iveco.changeEngineStatus(to: .stop)
Iveco.changeWindowsStatus(to: .open)
Iveco.changedoorsStatus(to: .open)
Iveco.changeTrunkState(to: .withoutFridge)
Iveco.printEngineStatus()
Iveco.printWindowsStatus()
Iveco.printDoorsStatus()

Volkswagen.changeEngineStatus(to: .start)
Volkswagen.changeTrunkState(to: .withFridge)
Volkswagen.printDoorsStatus()

Renault.changeWindowsStatus(to: .open)
Renault.changedoorsStatus(to: .open)
Renault.printWindowsStatus()
Renault.printDoorsStatus()
