//
//  Rabbit.swift
//  Rabbit
//
//  Created by Yoshiki Izumi on 2020/09/19.
//

import Foundation

public class Rabbit {

    public init() {}

    public func run(script: String) {
        guard let path = Bundle.main.path(forResource: script, ofType: "jump") else {return}
        do {
            let script = try String(contentsOfFile: path, encoding: String.Encoding.utf8)
            parse(script: "{\n" + script + " }", countUp: 0)
/*
            searchWhileF(script: script, funcInstance: Func(), word: "var", range: script.startIndex..<script.endIndex, function: searchWhileGlobalVar, funcWord: "")

            searchWhileF(script: script, funcInstance: Func(), word: "func", range: script.startIndex..<script.endIndex, function: searchWhileFunc, funcWord: "")

            searchWhileF(script: script, funcInstance: Func(), word: "class", range: script.startIndex..<script.endIndex, function: searchWhileClass, funcWord: "")
            


            for i in 0..<funcArray.count {
                if funcArray[i].function == "main" {
                    classParse(script: funcArray[i].script)
                    funcParse(script: funcArray[i].script)
                }
            }

            searchWhileC(script: classArray[0].script, funcInstance: classArray[0], word: "func", range: classArray[0].script.startIndex..<classArray[0].script.endIndex, function: searchWhileClassFunc, funcWord: "")

            
            for i in 0..<funcArray.count {
                if funcArray[i].function != "onTouchDown" && funcArray[i].function == "main" {
                    routine(func0: funcArray[i])
                }
            }
            */
        } catch let error as NSError {
            print("エラー: \(error)")
            return
        }
    }
    
    private func parse(script : String, countUp : Int) {
        let nextRange0 = script.startIndex..<script.endIndex
        // 関数の中身を取得
        guard let bracket0 = script.range(of: "{", options: .caseInsensitive, range: nextRange0) else {return}

        var end0 = bracket0
        
        var bracket1 = end0
        var count = 1
        while count >= 0 {
            
            guard let bracket31 = script.range(of: "{", options: .caseInsensitive, range: end0.upperBound..<script.endIndex) else {break}
            guard let bracket32 = script.range(of: "}", options: .caseInsensitive, range: end0.upperBound..<script.endIndex) else {break}
            if bracket31.upperBound < bracket32.upperBound {
                count += 1
                end0 = bracket31
                bracket1 = end0
            } else {
                count -= 1
                end0 = bracket32
                bracket1 = end0
            }
//                print("count:" + count.description)

            if count <= 0 {
                break
            }
        }
        if count >= 1 {
            guard let bracket32 = script.range(of: "}", options: .caseInsensitive, range: end0.upperBound..<script.endIndex) else {return}
            bracket1 = bracket32
        }
        let bracketRange = bracket0.upperBound..<bracket1.upperBound
        
        if countUp >= 0 {
            print(script[bracketRange].description)
        }
        parse(script: script[bracketRange].description, countUp: countUp + 1)
        
        
        parse(script: script[bracketRange.upperBound..<script.endIndex].description, countUp: 0)
        
        return

        
        
//        print(script[bracketRange].description)
        //class0.script = script[bracketRange].description
        //funcArray.append(func0)
//classArray.append(class0)

//        return bracket0
    }
}
