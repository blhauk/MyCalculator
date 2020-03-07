import UIKit

//Implementation of Shunting Yard algorithm
// https://stackoverflow.com/questions/54463146/how-to-execute-multiplications-and-or-divisions-in-the-right-order

let testArray = ["10", "+", "5", "*" , "4", "+" , "10", "+", "20", "/", "2"]

func getRPNArray(_ calculationArray: [String]) -> [String]{
    
    let c = calculationArray
    var myRPNArray = [String]()
    var operandArray = [String]()
    
    for i in 0...c.count - 1 {
        
        if c[i] != "+" && c[i] != "-" && c[i] != "*" && c[i] != "/" {
            //push number
            let number = c[i]
            myRPNArray.append(number)
            
        } else  {
            //if this is the first operand put it on the opStack
            if operandArray.count == 0 {
                let firstOperand = c[i]
                operandArray.append(firstOperand)
            } else {
                if  c[i] == "+" || c[i] == "-" {
                    
                    operandArray.reverse()
                    myRPNArray.append(contentsOf: operandArray)
                    operandArray = []
                    
                    let uniqOperand = c[i]
                    operandArray.append(uniqOperand)
                } else if c[i] == "*" || c[i] == "/" {
                    
                    let strongOperand = c[i]
                    
                    //If I want my mult./div. from right(eg because of parenthesis) the line below is all I need
                    //--------------------------------
                    //      operandArray.append(strongOperand)
                    //----------------------------------
                    
                    //If I want my mult./div. from left
                    let lastOperand = operandArray[operandArray.count - 1]
                    
                    if lastOperand == "+" || lastOperand == "-" {
                        operandArray.append(strongOperand)
                    } else {
                        myRPNArray.append(lastOperand)
                        operandArray.removeLast()
                        operandArray.append(strongOperand)
                    }
                }
            }
        }
        
    }
    
    //when I have no more numbers I append the reversed operant array
    operandArray.reverse()
    myRPNArray.append(contentsOf: operandArray)
    operandArray = []
    
    print("RPN: \(myRPNArray)")
    return myRPNArray
}

func getResultFromRPNarray(_ myArray: [String]) -> Double {
    var a = [String]()
    a = myArray
    print("a: \(a)")
    var result = Double()
    let n = a.count
    
    for i in 0...n - 1 {
        if n < 2 {
            result = Double(a[0])!
        } else {
            if a[i] == "p" {
                //Do nothing else. Calculations are over and the result is in your hands!!!
            } else {
                if a[i] == "+" {
                    
                    result = Double(a[i-2])! + Double(a[i-1])!
                    a.insert(String(result), at: i-2)
                    a.remove(at: i - 1)
                    a.remove(at: i - 1)
                    a.remove(at: i - 1)
                    a.insert("p", at: 0)
                    a.insert("p", at: 0)
                    
                } else if a[i] == "-" {
                    result = Double(a[i-2])! - Double(a[i-1])!
                    a.insert(String(result), at: i-2)
                    a.remove(at: i - 1)
                    a.remove(at: i - 1)
                    a.remove(at: i - 1)
                    a.insert("p", at: 0)
                    a.insert("p", at: 0)
                    
                } else if a[i] == "*" {
                    result = Double(a[i-2])! * Double(a[i-1])!
                    a.insert(String(result), at: i-2)
                    a.remove(at: i - 1)
                    a.remove(at: i - 1)
                    a.remove(at: i - 1)
                    a.insert("p", at: 0)
                    a.insert("p", at: 0)
                    
                } else if a[i] == "/" {
                    result = Double(a[i-2])! / Double(a[i-1])!
                    a.insert(String(result), at: i-2)
                    a.remove(at: i - 1)
                    a.remove(at: i - 1)
                    a.remove(at: i - 1)
                    a.insert("p", at: 0)
                    a.insert("p", at: 0)
                } else {
                    // it is a number so do nothing and go the next one
                }
                
                
            }//no over yet
        }//n>2
    }//iterating
    return result
}//Func

let rpnArray = getRPNArray(testArray)
print(testArray)
print(rpnArray)
let result = getResultFromRPNarray(rpnArray)
print(result)
