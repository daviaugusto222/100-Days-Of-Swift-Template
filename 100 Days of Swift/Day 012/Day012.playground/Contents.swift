import UIKit

//Handling missing data
var age: Int? = nil
age = 38

//Unwrapping optionals
var name: String? = nil
if let unwrapped = name {
    print("\(unwrapped.count) letters")
} else {
    print("Missing name.")
}

//unwrapping with guard
func greet(_ name: String?) {
    guard let unwrapped = name else {
        print("You didn't provide a name!")
        return
    }
    print("Hello, \(unwrapped)")
}

//Force unwrapping
let str = "5"
let num = Int(str)!

//Implicitly unwrapped optionals
let ageTwo: Int! = nil

//Nil Coalescing
func username(for id: Int) -> String? {
    if id == 1 {
        return "Lady Gaga"
    } else {
        return nil
    }
}
let user = username(for: 15) ?? "Anonymous"

//Optional chaining
let names = ["John", "Gaga", "Lady", "George"]
let beatle = names.first?.uppercased()

//Optional try
enum PasswordError: Error {
    case obvious
}
func checkPassword(_ password: String) throws -> Bool {
    if password == "password" {
        throw PasswordError.obvious
    }
    return true
}

do {
    try checkPassword("password")
    print("That password is good!")
} catch {
    print("You can't use that password.")
}

if let result = try? checkPassword("password") {
    print("Result was \(result)")
} else {
    print("D'oh.")
}

try! checkPassword("sekrity")
print("OK!")

//Failable initializers
struct Person {
    var id: String
    
    init?(id: String) {
        if id.count == 9 {
            self.id = id
        } else {
            return nil
        }
    }
}

//Typecasting
class Animal { }
class Fish: Animal { }

class Dog: Animal {
    func makeNoise() {
        print("WOOF!")
    }
}
let pets = [Fish(), Dog(), Fish(), Dog()]
for pet in pets {
    if let dog = pet as? Dog {
        dog.makeNoise()
    }
}
