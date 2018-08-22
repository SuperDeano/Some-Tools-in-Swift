//
//  date.swift
//
//  Created by Dean Chong San on 2018-06-13.
//  Copyright © 2018 Apple Inc. All rights reserved.
//

import Foundation

public class Date{
    
    //The variables
    var day, month, year : Int?
    var monthInLetter : String?
    let leapYear = 4
    
    //The array to know how many days in each month
    let daysInEachMonthNonLeapYear = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    let daysInEachMonthLeapYear = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    
    //Constructor with all three variables
    public init(day: Int, month: Int, year: Int){
        
        //Calls the function to check if the date is valid and then assigns the date
        setsDate(theDay : day, theMonth : month, theYear : year)
        
        //Function which changes the month into letters
        changeMonthIntoLetters()
    }
    
    //Constructor with not variables
    public init() {
        day = 1
        month = 1
        year = 2018
        //Calls the function to name the correct month in letters
        changeMonthIntoLetters()
    }
    
    //Function which makes sure that the date is correct
    public func setsDate(theDay day: Int,theMonth month: Int,theYear year: Int){
        
        var isTheDateValid : Bool = true
        
        //makes sure that the date cannot have a month and day bigger than 12 and 31 respectively or smaller than 1
        if (day < 1 || day > 31 || month < 1 || month > 12){
            isTheDateValid = false
        }
            
            /*Since we are not dealing with leap years, February will not have more than 28 days
             Therefore if the month is February and there's more than 28 days, the date is invalid*/
            
            //added the option to check for leap years
        else if (((year % 4 != 0)&&(month == 2 && day > 28)) || (year % 4 == 0 && (month == 2 && day > 29))){
            isTheDateValid = false
        }
            
            /*Some months have 30 days, if such month is entered with 31 days, like for november, then the date is invalid*/
        else if ((month == 4 || month == 6 || month == 9 || month == 11) && day > 30){
            isTheDateValid = false
        }
        
        if (isTheDateValid){
            //If the date is valid then the data members received the data
            self.day = day
            self.month = month
            self.year = year}
        else{
            //The date is not valid
            print("Invalid Date!")
            print ("Default Date Set")
            self.day = 21
            self.month = 08
            self.year = 2018
        }
    }
    
    
    //Looks what month it is then associates the right name and stores the name so that it can be quickly accessed
    func changeMonthIntoLetters(){
        //Dictionary which stores all the months
        let monthS = [1 : "January",2 : "February", 3 : "March", 4 : "April",5 : "May",6 : "June",7 : "July",8 : "August",9 : "September",10 : "October",11 : "November",12 : "December"]
        //The months in letter
        monthInLetter = monthS[month!]
    }
    
    //Function which returns the number of days between two dates
    public func numberOfDays(firstDay day1 : Int, firstMonth month1 : Int, firstYear year1 : Int, secondDay day2 : Int, secondMonth month2 : Int, secondYear year2 : Int)-> Int {
        
        //Variables to keep count of the sum of days
        var calcuDay1 = day1, calcuDay2 = day2, calcuMonth1 = month1, calcuMonth2 = month2, calcuYear1 = year1, calcuYear2 = year2, totalNumberOfDays: Int = 0
        
        repeat {
            //Year2 is smaller than year1, starts with the second date
            if (calcuYear1 > calcuYear2) {
                
                repeat
                {
                    //Leap year
                    if (calcuYear2 % leapYear == 0){
                        
                        //adds the remaining
                        totalNumberOfDays += daysInEachMonthLeapYear[calcuMonth2] - calcuDay2
                        calcuDay2 = 0
                        calcuMonth2 += 1
                    }
                        //Non Leap Year
                    else{
                        //adds remaining days
                        totalNumberOfDays += daysInEachMonthNonLeapYear[calcuMonth2] - calcuDay2
                        calcuMonth2 += 1
                        calcuDay2 = 0
                    }
                    
                    //Reached the end of the final month of the year
                    if (calcuMonth2 == 12){
                        calcuYear2 += 1
                        calcuMonth2 = 1
                    }
                }
                    while (calcuYear2 < calcuYear1)
            }
            //year 2 is bitter than year 1
            if (calcuYear2 > calcuYear1) {
                
                repeat{
                    //Leap year
                    if (calcuYear1 % leapYear == 0){
                        //Adds the remaining days
                        totalNumberOfDays += daysInEachMonthLeapYear[calcuMonth1 - 1] - calcuDay1
                        calcuDay1 = 0
                        calcuMonth1 += 1
                    }
                        
                        //Non Leap Year
                    else {
                        //adds remaining days
                        totalNumberOfDays += daysInEachMonthNonLeapYear[calcuMonth1 - 1] - calcuDay1
                        calcuMonth1 += 1
                        calcuDay1 = 0
                    }
                    
                    //Reached the end of the month of the year, increments the year
                    if (calcuMonth1 == 13){
                        calcuYear1 += 1
                        calcuMonth1 = 1
                    }
                }
                    while (calcuYear1 < calcuYear2)
            }
            
            //Same year but month2 is bigger than month1
            if ((calcuYear2 == calcuYear1) && (calcuMonth2 > calcuMonth1)){
                
                repeat{
                    //if the year is a leap year
                    if ( calcuYear1 % leapYear == 0){
                        totalNumberOfDays += daysInEachMonthLeapYear[calcuMonth1 - 1] - calcuDay1
                        calcuDay1 = 0
                        calcuMonth1 += 1}
                        
                        //non leap year
                    else {
                        totalNumberOfDays += daysInEachMonthNonLeapYear[calcuMonth1 - 1] - calcuDay1
                        calcuDay1 = 0
                        calcuMonth1 += 1
                    }
                }
                    while (calcuMonth1 < calcuMonth2)
                //adds the remaining amount of days in the second month
                totalNumberOfDays += calcuDay2
                calcuDay2 = 0
            }
            
            //Same year but month2 is smaller than month1
            if (calcuYear2 == calcuYear1 && calcuMonth2 < calcuMonth1){
                
                repeat{
                    //if the year is a leap year
                    if ( calcuYear2 % leapYear == 0){
                        totalNumberOfDays += daysInEachMonthLeapYear[calcuMonth2 - 1] - calcuDay2
                        calcuDay2 = 0
                        calcuMonth2 += 1
                    }
                        //non leap year
                    else{
                        totalNumberOfDays += daysInEachMonthNonLeapYear[calcuMonth2 - 1] - calcuDay2
                        calcuDay2 = 0
                        calcuMonth2 += 1
                    }
                }
                    while (calcuMonth2 < calcuMonth1)
                //adds the remaining amount of days in the second month
                totalNumberOfDays += calcuDay1
                calcuDay1 = 0
            }
            
            //Same year, same month, but day1 is bigger than day2
            if (calcuYear1 == calcuYear2 && calcuMonth1 == calcuMonth2 && calcuDay1 > calcuDay2){
                
                totalNumberOfDays += calcuDay1 - calcuDay2
                
                //set both of them to 0
                calcuDay1 = 0
                calcuDay2 = 0
            }
            
            //Same year, same month, but day1 is bigger than day2
            if (calcuYear1 == calcuYear2 && calcuMonth1 == calcuMonth2 && calcuDay2 > calcuDay1){
                
                totalNumberOfDays += calcuDay2 - calcuDay1
                
                //set both of them to 0
                calcuDay1 = 0
                calcuDay2 = 0
            }
            //loops until the right number of days has been added
        } while (calcuYear2 != calcuYear1 && calcuMonth2 != calcuMonth1 && calcuDay1 != calcuDay2)
        
        //Returns the sum of days
        return totalNumberOfDays;
    }
    
    public   func getDay()-> Int {
        return day!;
    }
    
    public   func getMonth()-> Int {
        return month!;
    }
    
    public   func getYear() -> Int {
        return year!;
    }
    
    //Function which returns the new date in three integers after a number of days was added to the date
    public func addNumberOfDaysToADate (theDay d : Int,theMonth m : Int,theYear y : Int, daysToBeAdded Adder : Int) -> (Int, Int, Int) {
        
        var tempDay: Int = d, tempMonth : Int = m, tempYear : Int = y, tempSubstractor : Int, daysBeingAdded : Int = Adder;
        
        repeat{
            
            //more than a month
            if daysBeingAdded >= 31 {
                
                //What to do during leap years
                if (tempYear % leapYear == 0){
                    //adds remaining days to go the first day of the first month
                    tempSubstractor = daysInEachMonthLeapYear[tempMonth - 1] - tempDay + 1
                    //Next day becomes the first of the next month
                    tempDay = 1
                    //number of days being is substracted
                    daysBeingAdded -= tempSubstractor
                    //Month changes
                    tempMonth += 1
                }
                    //Non leap year
                else{
                    //adds remaining days to go the first day of the first month
                    tempSubstractor = daysInEachMonthNonLeapYear[tempMonth - 1] - tempDay + 1
                    //Next day becomes the first of the next month
                    tempDay = 1
                    //number of days being is substracted
                    daysBeingAdded -= tempSubstractor
                    //Month changes
                    tempMonth += 1
                }
                
            }
                
            else {
                //Leap Year
                if (tempYear % leapYear == 0){
                    //adds the remaining days
                    tempDay += daysBeingAdded
                    //checks if the date overflows onto the next month
                    if (tempDay > daysInEachMonthLeapYear[tempMonth - 1]){
                        //Gets the right date into the next month
                        tempDay -= daysInEachMonthLeapYear[tempMonth - 1]
                        //gets the next month
                        tempMonth += 1
                    }
                }
                    //Non Leap Year
                else
                {
                    //adds the remaining days
                    tempDay += daysBeingAdded
                    //checks if the date overflows onto the next month
                    if (tempDay > daysInEachMonthNonLeapYear[tempMonth - 1]){
                        //Gets the right date into the next month
                        tempDay -= daysInEachMonthNonLeapYear[tempMonth - 1]
                        //gets the next month
                        tempMonth += 1
                    }
                }
                //All the days were added
                daysBeingAdded = 0
            }
            
            //Checks if december is reached => next year
            if (tempMonth == 13){
                tempYear += 1
                tempMonth = 1
            }
            
            //Continues until there are still days to be added
        } while daysBeingAdded != 0
        
        return (tempDay, tempMonth, tempYear);
    }
    //    function which prints the date
    public func printDATE(){
        print ("The Date is \(day!) \(monthInLetter!) \(year!)")
    }
}

