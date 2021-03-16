//
//  main.swift
//  L3_ilyasleptsov
//
//  Created by Илья Слепцов on 15.03.2021.
//
// 1. Описать несколько структур – любой легковой автомобиль SportCar и любой грузовик TrunkCar.
//
// 2. Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.
//
// 3. Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.
//
// 4. Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.
//
// 5. Инициализировать несколько экземпляров структур. Применить к ним различные действия.
//
// 6. Вывести значения свойств экземпляров в консоль.


// Делал по разбору д/з и пересматривал предыдущий урок


import Foundation

struct SportCar {
    let carBrand: String
    let yearOfRelease: Int
    let trunkVolume: Double
    var engineRunning: Bool
    var windowsStatus: Bool
    var filledTrunkVolume: Double
    
    enum Action {
        case startEngine
        case stopEngine
        case openWindow
        case closeWindow
        case fillTrunk(cargoVolume: Double)
        case emptyTrunk(cargoVolume: Double)
    }
    
    mutating func makeAction(action: Action) {
        switch action {
        case .startEngine:
            engineRunning = true
            print("Двигатель запущен")
        case .stopEngine:
            engineRunning = false
            print("Двигатель заглушен")
        case .openWindow:
            windowsStatus = true
            print("Окна открыты")
        case .closeWindow:
            windowsStatus = false
            print("Окна закрыты")
        case .fillTrunk (let cargoVolume):
            if cargoVolume <= (trunkVolume - filledTrunkVolume) {
                filledTrunkVolume += cargoVolume
                print("Багажник загружен: \(filledTrunkVolume) л.")
            } else {
                print("Объем багажника не вмещает весь груз. Заполненный объем: \(trunkVolume - filledTrunkVolume)")
            }
        case .emptyTrunk(let cargoVolume):
            if cargoVolume <= filledTrunkVolume {
                print("Недостаточно груза в багажнике")
            } else {
                filledTrunkVolume -= cargoVolume
                print("Багажник разгружен")
            }
        }
    }
    
    func printInfo() {
        print("Марка авто: \(self.carBrand)")
        print("Год выпуска: \(self.yearOfRelease)")
        print("Объем багажника: \(self.trunkVolume)")
        print("Состояние двигателя: \(self.engineRunning ? "Запущен" : "Заглушен")")
        print("Положение окон: \(self.windowsStatus ? "Открыты" : "Закрыты")")
        print("Загрузка багажника: \(self.trunkVolume)")
        
    }
}

var Skoda = SportCar(carBrand: "Skoda", yearOfRelease: 2018, trunkVolume: 400, engineRunning: false, windowsStatus: false, filledTrunkVolume: 200)

Skoda.printInfo()
Skoda.makeAction(action: .openWindow)
Skoda.makeAction(action: .fillTrunk(cargoVolume: 100))
Skoda.makeAction(action: .fillTrunk(cargoVolume: 100))
print(Skoda.filledTrunkVolume)

var Subaru = SportCar(carBrand: "Subaru", yearOfRelease: 2019, trunkVolume: 500, engineRunning: true, windowsStatus: true, filledTrunkVolume: 100)

Subaru.printInfo()
Subaru.makeAction(action: .stopEngine)
Subaru.makeAction(action: .closeWindow)
Subaru.makeAction(action: .fillTrunk(cargoVolume: 400))
print(Subaru.filledTrunkVolume)

var BMW = SportCar(carBrand: "BMW", yearOfRelease: 2020, trunkVolume: 600, engineRunning: true, windowsStatus: false, filledTrunkVolume: 600)

BMW.printInfo()
BMW.makeAction(action: .stopEngine)
BMW.makeAction(action: .openWindow)
BMW.makeAction(action: .emptyTrunk(cargoVolume: 400))
BMW.makeAction(action: .emptyTrunk(cargoVolume: 200))
print(BMW.filledTrunkVolume)


// ------------------------------------------------------------

struct TrunkCar {
    let carBrand: String
    let yearOfRelease: Int
    let bodyVolume: Double
    var engineRunning: Bool
    var windowsStatus: Bool
    var filledBodyVolume: Double
    
    enum Action {
        case startEngine
        case stopEngine
        case openWindow
        case closeWindow
        case fillBody(cargoVolume: Double)
        case emptyBody(cargoVolume: Double)
    }
    
    mutating func makeAction(action: Action) {
        switch action {
        case .startEngine:
            engineRunning = true
            print("Двигатель запущен")
        case .stopEngine:
            engineRunning = false
            print("Двигатель заглушен")
        case .openWindow:
            windowsStatus = true
            print("Окна открыты")
        case .closeWindow:
            windowsStatus = false
            print("Окна закрыты")
        case .fillBody (let cargoVolume):
            if cargoVolume <= (bodyVolume - filledBodyVolume) {
                filledBodyVolume += cargoVolume
                print("Кузов загружен: \(filledBodyVolume) л.")
            } else {
                print("Объем багажника не вмещает весь груз. Заполненный объем: \(bodyVolume - filledBodyVolume)")
            }
        case .emptyBody(let cargoVolume):
            if cargoVolume <= filledBodyVolume {
                print("Недостаточно груза в багажнике")
            } else {
                filledBodyVolume -= cargoVolume
                print("Багажник разгружен")
            }
        }
    }
    
    func printInfo() {
        print("Марка авто: \(self.carBrand)")
        print("Год выпуска: \(self.yearOfRelease)")
        print("Объем багажника: \(self.bodyVolume)")
        print("Состояние двигателя: \(self.engineRunning ? "Запущен" : "Заглушен")")
        print("Положение окон: \(self.windowsStatus ? "Открыты" : "Закрыты")")
        print("Загрузка багажника: \(self.bodyVolume)")
        
    }
}

var Iveco = TrunkCar(carBrand: "Iveco", yearOfRelease: 2019, bodyVolume: 4000, engineRunning: true, windowsStatus: false, filledBodyVolume: 1000)

Iveco.printInfo()
Iveco.makeAction(action: .openWindow)
Iveco.makeAction(action: .fillBody(cargoVolume: 1000))
Iveco.makeAction(action: .fillBody(cargoVolume: 2000))
print(Iveco.filledBodyVolume)

var Volkswagen = TrunkCar(carBrand: "Volkswagen", yearOfRelease: 2020, bodyVolume: 5000, engineRunning: true, windowsStatus: true, filledBodyVolume: 3000)

Volkswagen.printInfo()
Volkswagen.makeAction(action: .stopEngine)
Volkswagen.makeAction(action: .closeWindow)
Volkswagen.makeAction(action: .emptyBody(cargoVolume: 2000))
Volkswagen.makeAction(action: .fillBody(cargoVolume: 4000))
print(Volkswagen.filledBodyVolume)

var Renault = TrunkCar(carBrand: "Renault", yearOfRelease: 2021, bodyVolume: 6000, engineRunning: false, windowsStatus: false, filledBodyVolume: 5000)

Renault.printInfo()
Renault.makeAction(action: .startEngine)
Renault.makeAction(action: .openWindow)
Renault.makeAction(action: .emptyBody(cargoVolume: 4000))
Renault.makeAction(action: .fillBody(cargoVolume: 3000))
print(Renault.filledBodyVolume)
