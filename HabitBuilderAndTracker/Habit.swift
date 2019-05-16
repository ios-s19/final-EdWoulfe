//
//  Habit.swift
//  HabitBuilderAndTracker
//
//  Created by Woulfe, Edmond   (woulf002) on 5/14/19.
//  Copyright © 2019 akhil. All rights reserved.
//

import UIKit
class Habit: NSObject{
    var name: String
    
    
    init(name: String) {
        self.name = name
    }
    init(coder decoder: NSCoder) {
        self.name = decoder.decodeObject(forKey: "name") as! String
    }
    
    func encodeWithCoder(coder: NSCoder) {
        coder.encode(self.name, forKey: "name")
    }
}
