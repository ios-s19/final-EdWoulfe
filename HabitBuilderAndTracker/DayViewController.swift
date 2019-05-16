//
//  DayView.swift
//  HabitBuilderAndTracker
//
//  Created by Woulfe, Edmond   (woulf002) on 5/7/19.
//  Copyright © 2019 akhil. All rights reserved.
//

import UIKit
import CoreData

class DayViewController: UIViewController{
    
    @IBOutlet weak var habitTable: UITableView!
    @IBOutlet weak var addNewHabitButton: UIButton!
    @IBAction func backToCalendarButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: {});
        //self.navigationController?.popViewController(animated: true);
        

        
    }
    
    
    var habitTableArray = [Habit]()
 
    

    override func viewDidLoad() {
        super.viewDidLoad()
        habitTable.tableFooterView = UIView(frame: CGRect.zero)
        habitTable.delegate = self
        habitTable.dataSource = self
        let fetchRequest: NSFetchRequest<Habit> = Habit.fetchRequest()
        
        do{
        let habitTableArray = try PersistenceService.context.fetch(fetchRequest)
            self.habitTableArray = habitTableArray
            self.habitTable.reloadData()
        }catch {}
    }
   

    
    

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addSegue"{
            let newHabitViewController = segue.destination as! newHabitViewController
            newHabitViewController.parentView = self
            newHabitViewController.update = { (habit, monday, tuesday, wednesday, thursday, friday, saturday, sunday) in
                let newHabit = Habit(context: PersistenceService.context)
                newHabit.name = habit
                newHabit.monday = monday
                newHabit.tuesday = tuesday
                newHabit.wednesday = wednesday
                newHabit.thursday = thursday
                newHabit.friday = friday
                newHabit.saturday = saturday
                newHabit.sunday = sunday
                PersistenceService.saveContext()
                self.habitTableArray.append(newHabit)
                self.habitTable.reloadData()
            }
        }
    }
   

    
}
extension DayViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return habitTableArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HabitCell") as! HabitCell
        cell.habitNameLabel?.text = habitTableArray[indexPath.row].name
        if(habitTableArray[indexPath.row].monday == true){
            cell.mondayLabel?.text = "Mo"
        }else{
            cell.mondayLabel?.text = ""
        }
        if(habitTableArray[indexPath.row].tuesday == true){
            cell.tuesdayLabel?.text = "Tu"
        }else{
            cell.tuesdayLabel?.text = ""
        }
        if(habitTableArray[indexPath.row].wednesday == true){
            cell.wednesdayLabel?.text = "We"
        }else{
            cell.wednesdayLabel?.text = ""
        }
        if(habitTableArray[indexPath.row].thursday == true){
            cell.thursdayLabel?.text = "Th"
        }else{
            cell.thursdayLabel?.text = ""
        }
        if(habitTableArray[indexPath.row].friday == true){
            cell.fridayLabel?.text = "Fr"
        }else{
            cell.fridayLabel?.text = ""
        }
        if(habitTableArray[indexPath.row].saturday == true){
            cell.saturdayLabel?.text = "Sa"
        }else{
            cell.saturdayLabel?.text = ""
        }
        if(habitTableArray[indexPath.row].sunday == true){
            cell.sundayLabel?.text = "Su"
        }else{
            cell.sundayLabel?.text = ""
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(70)
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete{
            PersistenceService.context.delete(habitTableArray[indexPath.row])
            habitTableArray.remove(at: indexPath.row)
            habitTable.reloadData()
        }
        PersistenceService.saveContext()
        habitTable.reloadData()
    }
   
    
    
}





