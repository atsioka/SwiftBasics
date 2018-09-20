//import UIKit
//
//enum EngineType: String {
//  case diesel = "Дизельный"
//  case gasoline = "Бензиновый"
//  case unknown = "Неизвестен"
//}
//
//enum EngineState: String {
//  case idle = "Остановлен"
//  case running = "Запущен"
//  case failure = "Неисправность"
//}
//
//struct EngineInfo {
//  var state: EngineState
//  var type: EngineType
//  let power: Int
//
//  mutating func startEngine() {
//    self.state = .running
//    print ("Двигатель запущен")
//  }
//
//  mutating func stopEngine() {
//    self.state = .idle
//    print ("Двигатель остановлен")
//  }
//
//  init (){
//    self.type = .unknown
//    self.power = 0
//    self.state = .idle
//  }
//
//  init(type: EngineType, power: Int) {
//    self.type = type
//    self.power = power
//    self.state = .idle
//  }
//
//}
//
//enum WindowState {
//  case open, closed
//}
//
//enum DoorState {
//  case open, closed
//}
//
//enum Actions {
//  case startEngine, stopEngine
//  case openDoor, closeDoor
//  case openWindow, closeWindow
//  case load, unload
//  case beep
//}
//
//enum TruckBodyType{
//  case refrigerator, box, concrete, dump, flatbed, tank, wreckers,other
//}
//
//struct GenericCar {
//  let make: String
//  let year: Int
//  let trunkSize: Int
//  var trunkUsed: Int
//  private var windows: [WindowState]
//  var windowsCount: Int {
//    get {
//      return windows.count
//    }
//  }
//  private var doors: [DoorState]
//  var doorsCount: Int {
//    get {
//      return doors.count
//    }
//  }
//  var carEngine: EngineInfo
//
//  init (){
//    self.make = "Generic car"
//    self.year = 2018
//    self.trunkSize = 500
//    self.trunkUsed = 0
//    self.windows = Array(repeating: .closed, count: 4)
//    self.doors = Array(repeating: .closed, count: 4)
//    self.carEngine = EngineInfo()
//  }
//
//  init (carMake: String, carYear: Int, trunkSize: Int, doorsCount: Int, windowsCount: Int, engineType: EngineType, enginePower: Int){
//    self.make = carMake
//    self.year = carYear
//    self.trunkSize = trunkSize
//    self.trunkUsed = 0
//    self.windows = Array(repeating: .closed, count: windowsCount)
//    self.doors = Array(repeating: .closed, count: doorsCount)
//    self.carEngine = EngineInfo(type: engineType, power: enginePower)
//  }
//
//  private mutating func changeDoorState(doorNumber:Int, newState:DoorState){
//    if doorNumber == 0 {
//      for i in 0..<self.doors.count {
//        self.doors[i] = newState
//      }
//      print ("Состояние всех дверей изменено на", newState ,"у машины", self.make)
//    } else if doorNumber <= self.doors.count {
//      self.doors[doorNumber-1] = newState
//      print ("Состояние двери", doorNumber ,"изменено на", newState ,"у машины", self.make)
//    } else {
//      print ("Невозможно поменять статус двери у машины ", self.make )
//    }
//  }
//
//  private mutating func changeWindowState(windowNumber:Int, newState:WindowState){
//    if windowNumber == 0 {
//      for i in 0..<self.windows.count {
//        self.windows[i] = newState
//      }
//    } else if windowNumber <= self.windows.count {
//      self.windows[windowNumber-1] = newState
//    } else {
//      print ("Невозможно поменять статус двери у машины ", self.make )
//    }
//  }
//
//  private mutating func loadTrunk(amount: Int){
//    if self.trunkSize >= self.trunkUsed + amount && amount >= 0{
//      self.trunkUsed += amount
//      print ("Загружено", amount)
//    } else {
//      print ("Невозможно загрузить в багажник")
//    }
//  }
//
//  private mutating func unloadTrunk(amount: Int){
//    if self.trunkUsed - amount > 0 && amount >= 0{
//      self.trunkUsed -= amount
//      print ("Выгружено", amount)
//    } else {
//      print ("Невозможно выгрузить из багажника")
//    }
//  }
//
//  mutating func performAction(action: Actions, parameter: Int?=nil){
//    switch action {
//    case .startEngine:
//      self.carEngine.startEngine()
//    case .stopEngine:
//      self.carEngine.stopEngine()
//    case .openDoor:
//      changeDoorState(doorNumber: parameter ?? 0, newState: .open)
//    case .closeDoor:
//      changeDoorState(doorNumber: parameter ?? 0, newState: .closed)
//    case .openWindow:
//      changeWindowState(windowNumber: parameter ?? 0, newState: .open)
//    case .closeWindow:
//      changeWindowState(windowNumber: parameter ?? 0, newState: .closed)
//    case .load:
//      loadTrunk(amount: parameter ?? 0)
//    case .unload:
//      unloadTrunk(amount: parameter ?? 0)
//    case .beep:
//      print (self.make,"beep")
//    }
//  }
//}
//
//struct GenericTruck {
//  let make: String
//  let year: Int
//  let bodySize: Int
//  var bodyUsed: Int
//  var bodyType: TruckBodyType
//  var carEngine: EngineInfo
//  private var windows: [WindowState]
//  var windowsCount: Int {
//    get {
//      return windows.count
//    }
//  }
//  private var doors: [DoorState]
//  var doorsCount: Int {
//    get {
//      return doors.count
//    }
//  }
//
//
//  init (){
//    self.make = "Generic truck"
//    self.year = 2018
//    self.bodySize = 500
//    self.bodyType = .flatbed
//    self.bodyUsed = 0
//    self.windows = Array(repeating: .closed, count: 2)
//    self.doors = Array(repeating: .closed, count: 2)
//    self.carEngine = EngineInfo()
//  }
//
//  init (carMake: String, carYear: Int, trunkSize: Int, doorsCount: Int, windowsCount: Int, bodyType: TruckBodyType, engineType: EngineType, enginePower: Int){
//    self.make = carMake
//    self.year = carYear
//    self.bodySize = trunkSize
//    self.bodyType = bodyType
//    self.bodyUsed = 0
//    self.windows = Array(repeating: .closed, count: windowsCount)
//    self.doors = Array(repeating: .closed, count: doorsCount)
//    self.carEngine = EngineInfo(type: engineType, power: enginePower)
//  }
//
//  private mutating func changeDoorState(doorNumber:Int, newState:DoorState){
//    if doorNumber == 0 {
//      for i in 0..<self.doors.count {
//        self.doors[i] = newState
//      }
//      print ("Состояние всех дверей изменено на", newState ,"у машины", self.make)
//    } else if doorNumber <= self.doors.count {
//      self.doors[doorNumber-1] = newState
//      print ("Состояние двери", doorNumber ,"изменено на", newState ,"у машины", self.make)
//    } else {
//      print ("Невозможно поменять статус двери у машины ", self.make )
//    }
//  }
//
//  private mutating func changeWindowState(windowNumber:Int, newState:WindowState){
//    if windowNumber == 0 {
//      for i in 0..<self.windows.count {
//        self.windows[i] = newState
//      }
//    } else if windowNumber <= self.windows.count {
//      self.windows[windowNumber-1] = newState
//    } else {
//      print ("Невозможно поменять статус двери у машины ", self.make )
//    }
//  }
//
//  private mutating func loadTrunk(amount: Int){
//    if self.bodySize >= self.bodyUsed + amount && amount >= 0{
//      self.bodyUsed += amount
//      print ("Загружено", amount)
//    } else {
//      print ("Невозможно загрузить в кузов")
//    }
//  }
//
//  private mutating func unloadTrunk(amount: Int){
//    if self.bodyUsed - amount > 0 && amount >= 0{
//      self.bodyUsed -= amount
//      print ("Выгружено", amount)
//    } else {
//      print ("Невозможно выгрузить из кузова")
//    }
//  }
//
//  mutating func performAction(action: Actions, parameter: Int?=nil){
//    switch action {
//    case .startEngine:
//      self.carEngine.startEngine()
//    case .stopEngine:
//      self.carEngine.stopEngine()
//    case .openDoor:
//      changeDoorState(doorNumber: parameter ?? 0, newState: .open)
//    case .closeDoor:
//      changeDoorState(doorNumber: parameter ?? 0, newState: .closed)
//    case .openWindow:
//      changeWindowState(windowNumber: parameter ?? 0, newState: .open)
//    case .closeWindow:
//      changeWindowState(windowNumber: parameter ?? 0, newState: .closed)
//    case .load:
//      loadTrunk(amount: parameter ?? 0)
//    case .unload:
//      unloadTrunk(amount: parameter ?? 0)
//    case .beep:
//      print (self.make,"B-E-E-E-E-P")
//    }
//  }
//}
//var car1: GenericCar = GenericCar(carMake: "Honda", carYear: 2001, trunkSize: 200, doorsCount: 2, windowsCount: 2, engineType: .gasoline, enginePower: 180)
//var car2: GenericCar = GenericCar(carMake: "Volvo", carYear: 2015, trunkSize: 380, doorsCount: 4, windowsCount: 4, engineType: .gasoline, enginePower: 240)
//
//print ("Количество дверей у машины",car1.make,":" , car1.doorsCount)
//print ("Состояние двигателя у машины",car1.make,":" , car1.carEngine.state.rawValue)
//car1.performAction(action: .startEngine, parameter: 0)
//print ("Состояние двигателя у машины",car1.make,":" , car1.carEngine.state.rawValue)
//car2.performAction(action: .openDoor, parameter: 3)
//car2.performAction(action: .closeDoor)
//
//print ("Занято в багажнике у машины",car1.make,":" , car1.trunkUsed)
//car1.performAction(action: .unload, parameter: 100)
//print ("Занято в багажнике у машины",car2.make,":" , car2.trunkUsed)
//car2.performAction(action: .load, parameter: 50)
//print ("Занято в багажнике у машины",car2.make,":" , car2.trunkUsed)
//car1.performAction(action: .beep)
//
//
//var truck1: GenericTruck = GenericTruck()
//var truck2: GenericTruck = GenericTruck(carMake: "MAN", carYear: 1961, trunkSize: 6000, doorsCount: 2, windowsCount: 2, bodyType: .box, engineType: .diesel, enginePower: 1500)
//
//print ("Количество дверей у грузовика",truck1.make,":" , truck1.doorsCount)
//print ("Тип кузова у грузовика",truck1.make,":" , truck1.bodyType)
//print ("Тип двигателя у грузовика",truck1.make,":" , truck1.carEngine.type.rawValue)
//print ("Объем кузова у грузовика",truck2.make,":" , truck2.bodySize,"Из них используется:",truck2.bodyUsed)
//truck2.performAction(action: .load, parameter: 2489)
//print ("Объем кузова у грузовика",truck2.make,":" , truck2.bodySize,"Из них используется:",truck2.bodyUsed)
//truck1.performAction(action: .beep)
//truck2.performAction(action: .startEngine)
//print ("Состояние двигателя у грузовика",truck2.make,":" , truck2.carEngine.state.rawValue)



class Man {
    var myPassport: Passport?
    deinit{     // выведем в консоль сообщение о том, что объект удален
        print ("мужчина удален из памяти")
    }
}
class Passport {
     let man: Man
    init(man: Man) {
        self.man = man
    }
    deinit{     // выведем в консоль сообщение о том, что объект удален
        print("паспорт удален из памяти")
    }
}
var man: Man? = Man()
var passport: Passport? = Passport(man: man!)
passport = nil // объект еще не удален, его удерживает мужчина
man = nil     // теперь удалены оба объекта
