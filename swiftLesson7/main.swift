//
//  main.swift
//  swiftLesson7
//
//  Created by Olga Chumakova on 13.06.2021.
//

import Foundation

//1. Придумать класс, методы которого могут завершаться неудачей и возвращать либо значение, либо ошибку Error?. Реализовать их вызов и обработать результат метода при помощи конструкции if let, или guard let.

enum SpeedErrors: Error {
    case kmError(km: Double)
    case hourError(hour: Double)
}
class Car {
    let km: Double
    let hour: Double

    init(km: Double, hour: Double) {
        self.km = km
        self.hour = hour
    }
    
func carSpeed() -> (Double?, SpeedErrors?) {
    guard km > 0 else {
        return (nil, .kmError(km: km))
    }
    guard hour > 0 else {
        return (nil, .hourError(hour: hour))
    }
    let speed = (km / hour)
    return (speed, nil)
  }
}
let car = Car(km: 329, hour: 1.6).carSpeed()
if let speed = car.0 {
    print("Car speed is \(speed) km per hour.")
} else if let error = car.1 {
    print("Incorrect value is \(error).")
}

//2. Придумать класс, методы которого могут выбрасывать ошибки. Реализуйте несколько throws-функций. Вызовите их и обработайте результат вызова при помощи конструкции try/catch.
class Trunk {
    let km: Double
    let hour: Double

    init(km: Double, hour: Double) {
        self.km = km
        self.hour = hour
    }
    
    func trunkSpeed() throws -> Double {
        guard km > 0 else {
            throw SpeedErrors.kmError(km: km)
        }
        guard km > 0 else {
            throw SpeedErrors.hourError(hour: hour)
        }
        return (km / hour)
    }
}

do
{
    let trunk = try Trunk(km: 144, hour: 2.0).trunkSpeed()
    print("My trunk moves at \(trunk) km per hour")
} catch SpeedErrors.kmError(km: let km) {
    print("Value \(km) can't be <= 0")
} catch SpeedErrors.hourError(hour: let hour) {
    print("Value \(hour) can't be <= 0")
} catch let error {
    print(error)
}



