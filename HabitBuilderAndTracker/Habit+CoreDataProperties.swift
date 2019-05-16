//
//  Habit+CoreDataProperties.swift
//  HabitBuilderAndTracker
//
//  Created by Woulfe, Edmond   (woulf002) on 5/15/19.
//  Copyright © 2019 akhil. All rights reserved.
//
//

import Foundation
import CoreData


extension Habit {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Habit> {
        return NSFetchRequest<Habit>(entityName: "Habit")
    }

    @NSManaged public var name: String?
    @NSManaged public var monday: Bool
    @NSManaged public var tuesday: Bool
    @NSManaged public var wednesday: Bool
    @NSManaged public var thursday: Bool
    @NSManaged public var friday: Bool
    @NSManaged public var saturday: Bool
    @NSManaged public var sunday: Bool

}
