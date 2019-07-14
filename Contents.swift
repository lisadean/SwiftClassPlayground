import Cocoa

// Types, Constants & Variables
func types1() {
    let numberOfStoplights: Int = 4
    var population: Int
    population = 5422
    population += 2
    let townName: String = "Knowhere"
    let unemploymentRate: Double = 10
    let townDescription = "\(townName) has a population of \(population), \(numberOfStoplights) stoplights and an unemployment rate of \(String(format: "%.0f%%", unemploymentRate)))"
    print(townDescription)
}
//types1()

// Conditionals
func cond1() {
    let population: Int = 5422
    var message: String
    let hasPostOffice: Bool = true
    
    if population < 10000 {
        message = "\(population) is a small town!"
    } else {
        message = "\(population) is pretty big!"
    }
    print(message)
    
    if !hasPostOffice {
        print("Where do we buy stamps?")
    }
}

func cond2() {
    let population: Int = 5422
    var message: String
    let hasPostOffice: Bool = true
    
    message = population < 10000 ? "\(population) is a small town!" : "\(population) is pretty big!"
    
    print(message)
    
    if !hasPostOffice {
        print("Where do we buy stamps?")
    }
}

func cond3() {
    let population: Int = 5422
    var message: String
    let hasPostOffice: Bool = true
    
    if population < 10000 {
        message = "\(population) is a small town!"
    } else {
        if population >= 10000 && population < 50000 {
            message = "\(population) is a medium town!"
        } else {
        message = "\(population) is pretty big!"
        }
    }
    print(message)
    
    if !hasPostOffice {
        print("Where do we buy stamps?")
    }
}

// Numbers
func numbers1() {
    print("The maximum Int value is \(Int.max).")
    print("The minimum Int value is \(Int.min).")
    print("The minimum value for a 32-bit integer is \(Int32.max).")
    print("The mimimum value for a 32-bit integer is \(Int32.min).")
    print("The maximum UInt value is \(UInt.max).")
    print("The minimum UInt value is \(UInt.min).")
    print("The minimum value for a 32-bit integer is \(UInt32.max).")
    print("The mimimum value for a 32-bit integer is \(UInt32.min).")
    
}
numbers1()

// Arrays
func arrays1() {
    let toDoList = ["Take out garbage", "Cross off finished items", "Pay bills"]
    print("Is array empty? \(toDoList.isEmpty)")
    
    for item in toDoList.reversed() {
            print(item)
    }
    print(toDoList)
    print(toDoList.shuffled())
}

// Optionals
func optional1() {
    let bucketList = [
        "Watch the Lord of the Rings trilogy in one day",
        "Fly hot air balloon to Fiji",
        "Go on a walkabout",
        "Scuba dive in the Great Blue Hole",
        "Find a triple rainbow"
    ]
    
    let indexOfHotAirBalloon = bucketList.firstIndex(of: "Fly hot air balloon to Fiji")
    
    if indexOfHotAirBalloon != nil {
        //    print(indexOfHotAirBalloon!)
    }
    
    if let indexOfHotAirBalloon = indexOfHotAirBalloon {
        //    print(indexOfHotAirBalloon)
    }
    //else {
    //    print("not found")
    //}
    
    //print(indexOfHotAirBalloon!)
    
    var stuff: Int
    if let i = indexOfHotAirBalloon {
        stuff = i
    } else {
        stuff = -1
    }
    //print(stuff)
    
    stuff = indexOfHotAirBalloon ?? -1
    //print(stuff)
    
    //var things: String?
    //print(things!)
}

// Dictionary
func dict1() {
    var teams = [
        "team1": ["John", "John Jr."],
        "team2": ["Jane", "Jane Jr."],
        "team3": ["Joe", "Lisa"]
    ]
    
    //for team in teams {
    //    print(team)
    //    if let members = teams[members] {
    //        print("The \(team) has these players: \(members)")
    //    }
    //}
}

// Functions
func functions1() {
    func greetByMiddleName(fromFullName name: (first: String, middle: String?, last: String)) {
        guard let middleName = name.middle else {
            print("Hey there!")
            return
        }
        guard middleName.count < 4 else {
            print("Hey there")
            return
        }
        print("Hey \(middleName)")
    }
    //greetByMiddleName(fromFullName: ("Mikey", "Wookie", "Ward"))
    
    //func siftBeans(fromGroceryList: [String]) -> (String, [String]) {
    //    return ("beans": [""])
    //}
    //let result = siftBeans(fromGroceryList: ["grean beans",
    //                                         "milk",
    //                                         "black beans",
    //                                         "pinto benas",
    //                                         "apples"])
    //print(result.beans == ["grean beans", "black beans", "pinto beans"])
    //print(result.otherGroceries == ["milk", "apples"])
}

// Closures
func closures1 () {
    let volunteerCounts = [1,3,40,32,2,53,77,13]
    
    //func isAscending(_ i: Int, _ j: Int) -> Bool {
    //    return i < j
    //}
    //let volunteersSorted = volunteerCounts.sorted(by: {isAscending})
    
    let volunteersSorted = volunteerCounts.sorted(by: {
        (i: Int, j: Int) -> Bool in
        return i < j
    })
}

func closures2() {
    let volunteerCounts = [1,3,40,32,2,53,77,13]
    
//    let volunteersSorted = volunteerCounts.sorted(by: {
//        (i: Int, j: Int) -> Bool in
//        return i < j
//    })

    let volunteersSorted = volunteerCounts.sorted(by: { i, j in i < j })
}

func closures3() {
    let volunteerCounts = [1,3,40,32,2,53,77,13]
    
    let volunteersSorted = volunteerCounts.sorted(by: { $0 < $1 })
}

func closures4() {
    let volunteerCounts = [1,3,40,32,2,53,77,13]
    
    let volunteersSorted = volunteerCounts.sorted { $0 < $1 }
}

func closures5() {
    func format(numbers: [Double], using formatter: (Double)->String = {$0.description}) -> [String] {
        var result = [String]()
        for number in numbers {
            let transformed = formatter(number)
            result.append(transformed)
        }
        return result
    }
    let rounder: (Double) -> String = {
        (num: Double) -> String in
        return Int(num.rounded()).description
    }
    let volunteerAverages = [10.75, 4.2, 1.5, 12.12, 16.815]
    let roundedDescriptionsAsStrings = format(numbers: volunteerAverages, using: rounder)
    let exactAveragesAsStrings = format(numbers: volunteerAverages)
}
//closures5()

// Enums
func enums1() {
    enum TextAlignment {
        case left
        case right
        case center
    }
}
//enums1()
