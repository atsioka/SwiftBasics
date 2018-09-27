import Foundation

enum EngineType: String {
    case diesel = "Дизельный"
    case gasoline = "Бензиновый"
    case unknown = "Неизвестен"
}

enum EngineState: String {
    case idle = "Остановлен"
    case running = "Запущен"
    case failure = "Неисправность"
}

enum WindowState {
    case open, closed
}

enum DoorState {
    case open, closed
}

enum Actions {
    case startEngine, stopEngine
    case openDoor, closeDoor
    case openWindow, closeWindow
    case load, unload
    case beep
}

enum TruckBodyType{
    case refrigerator, box, concrete, dump, flatbed, tank, wreckers,other
}

class EngineInfo {
    var state: EngineState
    var type: EngineType
    let power: Int
    
    func startEngine() {
        self.state = .running
        print ("Двигатель запущен")
    }
    
    func stopEngine() {
        self.state = .idle
        print ("Двигатель остановлен")
    }
    
    init (){
        self.type = .unknown
        self.power = 0
        self.state = .idle
    }
    
    init(type: EngineType, power: Int) {
        self.type = type
        self.power = power
        self.state = .idle
    }
    
}

protocol GenericCar {
    var make: String {get set}
    var year: Int {get set}
    var doors: [DoorState] {get set}
    var windows: [WindowState] {get set}
    var carEngine: EngineInfo {get set}
    var windowsCount: Int { get }
    var doorsCount: Int { get }
    func performAction(action: Actions, parameter: Int?)
}

extension GenericCar {
    func OpenDoor(doorNumber: Int) -> Bool{
        return true
    }
    func CloseDoor(doorNumber: Int) -> Bool {
        return true
    }
}

extension GenericCar {
    func OpenWindow(windowNumber: Int) -> Bool{
        return true
    }
    func CloseWindow(windowNumber: Int) -> Bool {
        return true
    }
}

extension GenericCar {
    func StartEngine() -> Bool{
        return true
    }
    func StopEngine() -> Bool{
        return true
    }
}

class sportCar: GenericCar {
    var carEngine: EngineInfo
    var make: String
    var year: Int
    internal var windows: [WindowState]
    var windowsCount: Int {
        get {
            return windows.count
        }
    }
    internal var doors: [DoorState]
    var doorsCount: Int {
        get {
            return doors.count
        }
    }
    let trunkSize: Int
    var trunkUsed: Int
    var maxSpeed: Int
    
    init (){
        self.make = "Sport car"
        self.year = 2018
        self.maxSpeed = 250
        self.trunkSize = 500
        self.trunkUsed = 0
        self.windows = Array(repeating: .closed, count: 4)
        self.doors = Array(repeating: .closed, count: 4)
        self.carEngine = EngineInfo()
    }
    
    init (carMake: String, carYear: Int, maxSpeed: Int, trunkSize: Int, doorsCount: Int, windowsCount: Int, engineType: EngineType, enginePower: Int){
        self.make = carMake
        self.year = carYear
        self.maxSpeed =  maxSpeed
        self.trunkSize = trunkSize
        self.trunkUsed = 0
        self.windows = Array(repeating: .closed, count: windowsCount)
        self.doors = Array(repeating: .closed, count: doorsCount)
        self.carEngine = EngineInfo(type: engineType, power: enginePower)
    }
    
    private func changeDoorState(doorNumber:Int, newState:DoorState){
        if doorNumber == 0 {
            for i in 0..<self.doors.count {
                self.doors[i] = newState
            }
            print ("Состояние всех дверей изменено на", newState ,"у машины", self.make)
        } else if doorNumber <= self.doors.count {
            self.doors[doorNumber-1] = newState
            print ("Состояние двери", doorNumber ,"изменено на", newState ,"у машины", self.make)
        } else {
            print ("Невозможно поменять статус двери у машины ", self.make )
        }
    }
    
    private func changeWindowState(windowNumber:Int, newState:WindowState){
        if windowNumber == 0 {
            for i in 0..<self.windows.count {
                self.windows[i] = newState
            }
        } else if windowNumber <= self.windows.count {
            self.windows[windowNumber-1] = newState
        } else {
            print ("Невозможно поменять статус двери у машины ", self.make )
        }
    }
    
    func loadTrunk(amount: Int){
        if self.trunkSize >= self.trunkUsed + amount && amount >= 0{
            self.trunkUsed += amount
            print ("Загружено", amount)
        } else {
            print ("Невозможно загрузить в багажник")
        }
    }
    
    func unloadTrunk(amount: Int){
        if self.trunkUsed - amount > 0 && amount >= 0{
            self.trunkUsed -= amount
            print ("Выгружено", amount)
        } else {
            print ("Невозможно выгрузить из багажника")
        }
    }
    
    func performAction(action: Actions, parameter: Int?=nil){
        switch action {
        case .startEngine:
            self.carEngine.startEngine()
        case .stopEngine:
            self.carEngine.stopEngine()
        case .openDoor:
            changeDoorState(doorNumber: parameter ?? 0, newState: .open)
        case .closeDoor:
            changeDoorState(doorNumber: parameter ?? 0, newState: .closed)
        case .openWindow:
            changeWindowState(windowNumber: parameter ?? 0, newState: .open)
        case .closeWindow:
            changeWindowState(windowNumber: parameter ?? 0, newState: .closed)
        case .load:
            loadTrunk(amount: parameter ?? 0)
        case .unload:
            unloadTrunk(amount: parameter ?? 0)
        case .beep:
            print (self.make,"beep")
        }
    }
}

class trunkCar: GenericCar {
    func performAction(action: Actions, parameter: Int?) {
        switch action {
        case .startEngine:
            self.carEngine.startEngine()
        case .stopEngine:
            self.carEngine.stopEngine()
        case .openDoor:
            changeDoorState(doorNumber: parameter ?? 0, newState: .open)
        case .closeDoor:
            changeDoorState(doorNumber: parameter ?? 0, newState: .closed)
        case .openWindow:
            changeWindowState(windowNumber: parameter ?? 0, newState: .open)
        case .closeWindow:
            changeWindowState(windowNumber: parameter ?? 0, newState: .closed)
        case .load:
            loadTrunk(amount: parameter ?? 0)
        case .unload:
            unloadTrunk(amount: parameter ?? 0)
        case .beep:
            print (self.make,"beep")
        }
    }
    
    private func changeDoorState(doorNumber:Int, newState:DoorState){
        if doorNumber == 0 {
            for i in 0..<self.doors.count {
                self.doors[i] = newState
            }
            print ("Состояние всех дверей изменено на", newState ,"у машины", self.make)
        } else if doorNumber <= self.doors.count {
            self.doors[doorNumber-1] = newState
            print ("Состояние двери", doorNumber ,"изменено на", newState ,"у машины", self.make)
        } else {
            print ("Невозможно поменять статус двери у машины ", self.make )
        }
    }
    
    private func changeWindowState(windowNumber:Int, newState:WindowState){
        if windowNumber == 0 {
            for i in 0..<self.windows.count {
                self.windows[i] = newState
            }
        } else if windowNumber <= self.windows.count {
            self.windows[windowNumber-1] = newState
        } else {
            print ("Невозможно поменять статус двери у машины ", self.make )
        }
    }
    
    private func loadTrunk(amount: Int){
        if self.bodySize >= self.bodyUsed + amount && amount >= 0{
            self.bodyUsed += amount
            print ("Загружено", amount)
        } else {
            print ("Невозможно загрузить в кузов")
        }
    }
    
    private func unloadTrunk(amount: Int){
        if self.bodyUsed - amount > 0 && amount >= 0{
            self.bodyUsed -= amount
            print ("Выгружено", amount)
        } else {
            print ("Невозможно выгрузить из кузова")
        }
    }
    var carEngine: EngineInfo
    var make: String
    var year: Int
    internal var windows: [WindowState]
    var windowsCount: Int {
        get {
            return windows.count
        }
    }
    internal var doors: [DoorState]
    var doorsCount: Int {
        get {
            return doors.count
        }
    }
    
    var bodySize: Int
    var bodyUsed: Int
    var bodyType: TruckBodyType
    
    init (){
        self.make = "Generic truck"
        self.year = 2018
        self.bodySize = 5000
        self.bodyType = .flatbed
        self.bodyUsed = 0
        self.windows = Array(repeating: .closed, count: 2)
        self.doors = Array(repeating: .closed, count: 2)
        self.carEngine = EngineInfo()
    }
    
    init (carMake: String, carYear: Int, trunkSize: Int, doorsCount: Int, windowsCount: Int, bodyType: TruckBodyType, engineType: EngineType, enginePower: Int){
        self.make = carMake
        self.year = carYear
        self.bodySize = trunkSize
        self.bodyType = bodyType
        self.bodyUsed = 0
        self.windows = Array(repeating: .closed, count: windowsCount)
        self.doors = Array(repeating: .closed, count: doorsCount)
        self.carEngine = EngineInfo(type: engineType, power: enginePower)
    }
}

extension sportCar: CustomStringConvertible {
    var description: String {
        return "Sport Car: \(make) made in \(year) with \(maxSpeed) km/h maximum speed and \(carEngine.type) engine"
    }
}

extension trunkCar: CustomStringConvertible {
    var description: String {
        return "Trunk Car: \(make) made in \(year) with \(bodySize) body and \(bodyUsed) of it used and \(carEngine.type) engine"
    }
}
var myHonda: sportCar = sportCar(carMake: "Honda", carYear: 1958, maxSpeed: 200, trunkSize: 153, doorsCount: 2, windowsCount: 4, engineType: .gasoline, enginePower: 110)
print (myHonda)

var myKamaz: trunkCar = trunkCar(carMake: "Kamaz", carYear: 1998, trunkSize: 9800, doorsCount: 2, windowsCount: 2, bodyType: .concrete, engineType: .diesel, enginePower: 450)
print (myKamaz)

myKamaz.performAction(action: .load, parameter: 2000)

print (myKamaz)
