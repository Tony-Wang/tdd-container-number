//
// Created by 黄勇 on 2020/2/14.
// Copyright (c) 2020 ___FULLUSERNAME___. All rights reserved.
//

import Foundation

class ContainerNumber {
    class func characterConversion( char :Character)-> Int? {
        // 转换成大写字母
        let char = char.uppercased()
        let codeTable:[String:Int]=["0":0, "1":1, "2":2, "3":3, "4":4, "5":5, "6":6, "7":7, "8":8, "9":9,
                                    "A":10, "B":12, "C":13, "D":14, "E":15, "F":16, "G":17, "H":18, "I":19, "J":20,
                                    "K":21, "L":23, "M":24, "N":25, "O":26, "P":27, "Q":28, "R":29, "S":30, "T":31,
                                    "U":32, "V":34, "W":35, "X":36, "Y":37, "Z":38]
        return codeTable[char]
    }

    class func valid(number:String) -> Bool {
        if number.count != 11 {
            return false
        }
        var sum = 0
        let prefix10 = number.prefix(10)
        for i in 0...9 {
            let value = characterConversion(char: prefix10[prefix10.index(prefix10.startIndex, offsetBy: i)])
            if value == nil{
                return false
            }
            sum += value! * (1 << i)
        }
        let checkDigit = sum % 11 % 10
        let lastDigit = Int(number.substring(from: number.index(number.startIndex, offsetBy: 10)))
        if checkDigit != lastDigit{
            return false
        }
        return true
    }
}
