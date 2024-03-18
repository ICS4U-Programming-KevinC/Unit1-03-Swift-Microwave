//
//  Microwave.swift
//
//  Created by Kevin Csiffary
//  Created on 2024-02-08
//  Version 1.0
//  Copyright (c) 2024 Kevin Csiffary. All rights reserved.
//
//  Calculates the time it will take to microwave something.

import Foundation

enum InputError: Error {
    case nonNumber
}

final class Microwave {
    private init() {}

    static func main() {
        let pizzaTime: Float = 45
        let subTime: Float = 60
        let soupTime: Float = 105

        var time: Float = 0

        // Tell the user what the program does.
        print("This program calculates the time", terminator: "")
        print(" it will take to microwave something!")

        // Setup try catch
        do {
            // Get user input.
            print("What item are you microwaving? soup, sub, or pizza")
            guard let item = readLine() else {
                throw InputError.nonNumber
            }
            print("How many are you microwaving? (1, 2, or 3)")
            guard let amountString = readLine(), let amount = Int(amountString) else {
                throw InputError.nonNumber
            }

            if 0 < amount && amount < 4 {
                // Check the item and then calculate the time.
                if item == "soup" {
                    time = soupTime + ((soupTime / 2) * Float(amount - 1))
                } else if item == "sub" {
                    time = subTime + ((subTime / 2) * Float(amount - 1))
                } else if item == "pizza" {
                    time = pizzaTime + ((pizzaTime / 2) * Float(amount - 1))
                } else {
                    print("Please enter either soup, sub or pizza.")
                    return
                }

                // Calculate the minutes and seconds.
                let minutes = Int(time) / 60
                let seconds = time.truncatingRemainder(dividingBy: 60)

                // Tell the user the time it will take.
                print("It will take \(minutes) minutes and \(String(format: "%.1f", seconds)) seconds to cook \(amount) \(item)(s).")
            } else {
                print("Please enter 1, 2, or 3!")
            }
        } catch {
            print("Please enter a proper number!")
        }
    }
}

// Call the main function
Microwave.main()
