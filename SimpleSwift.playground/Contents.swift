import Foundation

print("Welcome to the UW Calculator Playground")

func calculate(_ args: [String]) -> Int {
    let args_size = args.count - 1
    // single value array
    if (args.count == 1) {
        return 0
    }
    // handle fact, avg, count arrays
    switch args[args_size] {
        case "fact":
            let factorial = Int(args[0]) ?? -1
            if factorial == -1 || factorial == 0 {
                return factorial + 1
            }
            var product = 1;
            for n in 1...factorial {
                product *= n
            }
            return product
        case "avg":
            var sum = 0
            for digit in 0...args.count - 1 {
                sum += Int(args[digit]) ?? 0
            }
            return sum / (args.count - 1)
        case "count":
            return args_size
        default:
            break
    }
    
    // arithmetic operations
    for _ in args {
        let n1 = Int(args[0]) ?? 1
        let n2 = Int(args[2]) ?? 1
        let op = args[1]
        if op == "/" {
            return n1 / n2
        } else if op == "+" {
            return n1 + n2
        } else if op == "-" {
            return n1 - n2
        } else if op == "*" {
            return n1 * n2
        } else if op == "%" {
            return n1 % n2
        }
    }
    return -1
}

func calculate(_ arg: String) -> Int {
    return calculate(arg.components(separatedBy: " "))
}

// -------------------------------------------
// All of these expressions should return true
// if you have implemented calculate() correctly
//
calculate(["2", "+", "2"]) == 4
calculate(["4", "+", "4"]) == 8
calculate(["2", "-", "2"]) == 0
calculate(["2", "*", "2"]) == 4
calculate(["2", "/", "2"]) == 1
calculate(["2", "%", "2"]) == 0

calculate(["1", "2", "3", "count"]) == 3
calculate(["1", "2", "3", "4", "5", "count"]) == 5
calculate(["count"]) == 0

calculate(["1", "2", "3", "4", "5", "avg"]) == 3
    // 15 / 5 = 3
calculate(["2", "2", "4", "4", "avg"]) == 3
    // 12 / 4 = 3
calculate(["2", "avg"]) == 2
    // 2 / 1 = 2
calculate(["avg"]) == 0
    // 0 / 0 = 0 (not really, but it's an edge case
calculate(["0", "fact"]) == 1
calculate(["1", "fact"]) == 1
calculate(["2", "fact"]) == 2 // 2*1
calculate(["5", "fact"]) == 120 // 5*4*3*2*1
calculate(["fact"]) == 0

calculate("2 + 2") == 4
calculate("2 * 2") == 4
calculate("2 - 2") == 0
calculate("2 / 2") == 1

calculate("1 2 3 4 5 count") == 5
calculate("1 2 3 4 5 avg") == 3
calculate("5 fact") == 120

// -------------------------------------------
// These are extra credit tests; commented out
// uncomment them to turn them on for evaluation
// Implement calculate([String]) and calculate(String)
// to handle negative numbers

calculate(["2", "+", "-2"]) == 0
calculate(["2", "-", "-2"]) == 4
calculate(["2", "*", "-2"]) == -4
calculate(["2", "/", "-2"]) == -1
calculate(["-5", "%", "2"]) == -1
calculate(["1", "-2", "3", "-2", "5", "avg"]) == 1
calculate("2 + -2") == 0
calculate("2 * -2") == -4
calculate("2 - -2") == 4
calculate("-2 / 2") == -1
calculate("1 -2 3 -4 5 count") == 5

 
// Implement calculate([String]) and calculate(String)
// to use floating-point values

func calculate(_ args: [String]) -> Double {
    let n1 = Double(args[0]) ?? 1
    let n2 = Double(args[2]) ?? 1
    let op = args[1]
    if op == "/" {
        return n1 / n2
    } else if op == "+" {
        return n1 + n2
    } else if op == "-" {
        return n1 - n2
    } else if op == "*" {
        return n1 * n2
    } else if op == "%" {
        return n1.truncatingRemainder(dividingBy: n2)
    }
    return 1.0
}

func calculate(_ arg: String) -> Double {
    return calculate(arg.components(separatedBy: " "))
}
calculate(["2.0", "+", "2.0"]) == 4.0
calculate([".5", "+", "1.5"]) == 2.0
calculate(["12.0", "-", "12.0"]) == 0.0
calculate(["2.5", "*", "2.5"]) == 6.25
calculate(["2.0", "/", "2.0"]) == 1.0
calculate(["2.0", "%", "2.0"]) == 0.0
calculate("1.0 2.0 3.0 4.0 5.0 count") == 5
