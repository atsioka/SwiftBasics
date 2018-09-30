import Foundation

struct Queue<T>{
    private var items: [T] = []
    
    var size: Int? {
        return items.isEmpty ? nil : items.count
    }
    
    var lastItem: T? {
        return items.isEmpty ? nil : items[items.count - 1]
    }
    
    var firstItem: T? {
        return items.isEmpty ? nil : items[0]
    }
    
    var isEmpty: Bool {
        return items.isEmpty
    }
    
    mutating func enqueue(_ item: T) {
        items.append(item)
    }
    
    mutating func dequeue() -> T? {
        return items.isEmpty ? nil : items.removeFirst()
    }
    
    subscript (index: Int) -> T?{
        return items.isEmpty || index < items.count-1  ? nil : items[index]
    }
    
    func replace(_ newValue: T ,_ predicate: (T) -> Bool ) -> [T] {
        var tmpArray = [T]()
        for element in items {
            if predicate(element) {
                tmpArray.append(newValue)
            }
            else {
                tmpArray.append(element)
            }
        }
        return tmpArray
    }
}

extension Queue: CustomStringConvertible {
    public var description: String {
        return items.description
    }
}

let lessThen50: (Int) -> Bool = { $0 < 50 }

var myQ=Queue<Int>()

print (myQ)

print (myQ[1])

myQ.enqueue(234)
myQ.enqueue(765)
myQ.enqueue(5)
print (myQ)
print(myQ.replace(100,lessThen50))

