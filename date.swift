//
//  date.swift
//
//  Created by Dean Chong San on 2018-06-13.
//  Copyright © 2018 Apple Inc. All rights reserved.
//

import Foundation

class Date{
    
    //The variables
    var day, month, year : Int?
    var monthInLetter : String?
    
   //Constructor with all three variables
    init(day: Int, month: Int, year: Int){
 
    //Calls the function to check if the date is valid and then assigns the date
    setsDate(theDay : day, theMonth : month, theYear : year)
     
    //Function which changes the month into letters
    changeMonthIntoLetters()
    }
    
    //Constructor with not variables
    init() {
        day = 1
        month = 1
        year = 2018
        //Calls the function to name the correct month in letters
        changeMonthIntoLetters()
    }
    
    //Function which makes sure that the date is correct
    func setsDate(theDay day: Int,theMonth month: Int,theYear year: Int){
        
        var isTheDateValid : Bool = false
        
        //makes sure that the date cannot have a month and day bigger than 12 and 31 respectively or smaller than 1
        if (day < 1 || day > 31 || month < 1 || month > 12){
            isTheDateValid = true}
       
        /*Since we are not dealing with leap years, February will not have more than 28 days
        Therefore if the month is February and there's more than 28 days, the date is invalid*/
        else if (month == 2 && day > 28){
            isTheDateValid = true}
        
        /*Some months have 30 days, if such month is entered with 31 days, like for november, then the date is invalid*/
        else if ((month == 4 || month == 6 || month == 9 || month == 11) && day > 30){
            isTheDateValid = true}
        else{
            //The date is not valid
            print("Invalid Date!")
            print ( "Default Date Set")
            self.day = 1
            self.month = 1
            self.year = 2018
        }
        if (!isTheDateValid){
        //If the date is valid then the data members received the data
        self.day = day
        self.month = month
        self.year = year}
    }

    //Looks what month it is then associates the right name and stores the name so that it can be quickly accessed
    func changeMonthIntoLetters(){
    //Dictionary which stores all the months
        let monthS = [1 : "January",2 : "February", 3 : "March", 4 : "April",5 : "May",6 : "June",7 : "July",8 : "August",9 : "September",10 : "October",11 : "November",12 : "December"]
    //The months in letter
        monthInLetter = monthS[month!]
    }

    //Function which returns the number of days between two dates
    func numberOfDays(firstDay day1 : Int,firstMonth month1 : Int,firstYear year1 : Int,secondDay day2 : Int,secondMonth month2 : Int,secondYear year2 : Int)-> Int {
    //The array to know how many days in each month
        let daysInEachMonth = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    //Variables to keep count of the sum of days
        var keepingCountDay1 : Int = 0, keepingCountDay2 : Int = 0, sortedDay1 : Int, sortedDay2 : Int, sortedMonth1 : Int, sortedMonth2 : Int, sortedYear1 : Int, sortedYear2 : Int = 0, totalNumberOfDays: Int = 0
    
    //sorts the two dates entered by the user in the correct order
    if (year1 > year2) {
    sortedYear1 = year1;
    sortedYear2 = year2;
    sortedMonth1 = month1;
    sortedMonth2 = month2;
    sortedDay1 = day1;
    sortedDay2 = day2;
    } else {
    sortedYear1 = year2;
    sortedYear2 = year1;
    sortedMonth2 = month1;
    sortedMonth1 = month2;
    sortedDay1 = day2;
    sortedDay2 = day1;
    }
    
    //if the years are not the same then we take the sum of days between each full years
    if (sortedYear1 != sortedYear2) {
    
    totalNumberOfDays = (sortedYear1 - sortedYear2 - 1) * 365;
    
    
    //Calculate how many days until the end of the first year starting from the next month
        for index in sortedMonth2...daysInEachMonth.count {
    keepingCountDay1 += daysInEachMonth[index];
    }
    //Then add the number of days to go in the month
    keepingCountDay1 += daysInEachMonth[sortedMonth1 - 1] - sortedDay2;
    
    //Calculate the number of days since the beginning of the second year until the month before
    for  y in 0...(sortedMonth1 - 1) {
    keepingCountDay2 += daysInEachMonth[y];
    }
    //Then add the number of days passed in the month
    keepingCountDay2 += sortedDay1;
    //The total days is the addition of everything
    totalNumberOfDays += (keepingCountDay1 + keepingCountDay2 + 1);
    }
    
    //Does the counting if the two years are the same
    else {
    //if it's the same year, then the program does the right addition/substraction depending on the dates
    if (month1 > month2) {
    for z in (month2 - 1)...(month1 - 1) {
    keepingCountDay1 += daysInEachMonth[z];
    }
    keepingCountDay1 += ((daysInEachMonth[month2 - 1] - day2) + day1);
    
    }
    else if (month2 > month1) {
    for w in (month1 - 1)...(month2 - 1) {
    keepingCountDay1 += daysInEachMonth[w];
    }
    keepingCountDay1 += ((daysInEachMonth[month1 - 1] - day1) + day2);
    }
    //Does the counting if the two years and months are the same
    else {
    if (day1 > day2) {
    keepingCountDay1 = day1 - day2;
    } else {
    keepingCountDay1 = day2 - day1;
    }
    }
    totalNumberOfDays = keepingCountDay1 + keepingCountDay2;
    }
    //Caculate how many days have passed in the other year
    return totalNumberOfDays;
    }
    
    func getDay()-> Int {
        return day!;
    }
    
    func getMonth()-> Int {
    return month!;
    }
    
    func getYear() -> Int {
    return year!;
    }
    
    //Function which returns the new date in three integers after a number of days was added to the date
    func addNumberOfDaysToADate (theDay d : Int,theMonth m : Int,theYear y : Int, daysToBeAdded Adder : Int) -> (Int, Int, Int) {
    
        var tempDay: Int = d, tempMonth : Int = m, tempYear : Int = y, substractor : Int, adder : Int = Adder;
    
    
    while (adder > 30) {
    if (tempMonth == 4 || tempMonth == 6 || tempMonth == 9 || tempMonth == 11) {
    substractor = 31 - tempDay;
    tempDay = 1;
    tempMonth += 1;
    adder -= substractor;
     
    } else if (tempMonth == 1 || tempMonth == 3 || tempMonth == 5 || tempMonth == 7 || tempMonth == 8 ||
    tempMonth == 10 || tempMonth == 12) {
    substractor = 32 - tempDay;
    tempDay = 1;
    tempMonth += 1;
    adder -= substractor;
    
    
    } else if (tempMonth == 2) {
    substractor = 29 - tempDay;
    tempDay = 1;
    tempMonth += 1;
    adder -= substractor;
    }
        
    }
    if ((adder <= 30) && (adder > 0)) {
    
    tempDay += adder;
    
    if ((tempMonth == 4 || tempMonth == 6 || tempMonth == 9 || tempMonth == 11) && tempDay >= 31) {
    tempMonth += 1;
    tempDay -= 30;
    }
    
    else if ((tempMonth == 1 || tempMonth == 3 || tempMonth == 5 || tempMonth == 7 || tempMonth == 8 ||
    tempMonth == 10 || tempMonth == 12) && tempDay >= 32) {
    tempMonth += 1;
    tempDay -= 31;
    }
    
    else if (tempMonth == 2 && tempDay >= 29) {
    tempMonth += 1;
    tempDay -= 28
    }
    }
    return (tempDay, tempMonth, tempYear);
}
}
