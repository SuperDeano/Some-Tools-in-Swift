//
//  RatingControl.swift
//  FoodTracker
//
//  Created by Dean Chong San on 2018-09-08.
//  Copyright © 2018 Apple Inc. All rights reserved.
//

import UIKit

@IBDesignable class RatingControl: UIStackView {

    //MARK: Properties
    private var ratingButtons = [UIButton]()
  
    //They define the size of the buttons
    @IBInspectable var starSize : CGSize = CGSize (width: 44.0, height: 44.0){
        //Checks if the values were changed/set
        didSet {
            setupButtons()
        }
    }
    @IBInspectable var starCount : Int = 5{
        didSet{
            setupButtons()
        }
    }
    var rating = 0{
        didSet{
            //If the rating is set to 0, the function which changes the buttons is called
            updateButtonSelectionStates()
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButtons()
    }
    
   required init(coder: NSCoder) {
        super.init(coder: coder)
        setupButtons()
    }
    
    //MARK: Private Methods
    private func setupButtons(){
    
        //Clear any existing buttons
        for button in ratingButtons{
            removeArrangedSubview(button)
            button.removeFromSuperview()
        }
        ratingButtons.removeAll()
        
        //Load Button Images
        let bundle = Bundle(for: type(of: self))
        let filledStar = UIImage(named: "filledStar", in: bundle, compatibleWith: self.traitCollection)
        let emptyStar        = UIImage(named: "emptyStar", in: bundle, compatibleWith: self.traitCollection)
        let highlightedStar = UIImage(named: "highlightedStar", in: bundle, compatibleWith: self.traitCollection)
        
        //starCount is the number of button
        for _ in 0..<starCount {
            
            //Creates a button
            let button = UIButton()
            button.setImage(emptyStar, for: .normal)
            button.setImage(filledStar, for: .selected)
            button.setImage(highlightedStar, for: .highlighted)
            button.setImage(highlightedStar, for: [.highlighted,.selected])
            
            //Button Constraints
            //Disables the button's automatically generated constraints
            button.translatesAutoresizingMaskIntoConstraints = false
            
            //Defines the button's height
            button.heightAnchor.constraint(equalToConstant: starSize.height).isActive = true
            //Defines the button's width
            button.widthAnchor.constraint(equalToConstant: starSize.width).isActive = true
            
            //Setup the button Action
            button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(button:)), for: .touchUpInside)
            
            //Adds the button to the stack
            addArrangedSubview(button)
            
            //Adds the new button to the rating button array
            ratingButtons.append(button)
        }
        //Calls the function which chanages the looks of the buttons
        updateButtonSelectionStates()
    }
    //MARK: Button Action
    @objc func ratingButtonTapped(button: UIButton){
        guard let index = ratingButtons.index(of: button) else {
            fatalError("The button, \(button), is not in the ratingButtons array: \(ratingButtons)")
        }
        
        //Calculate the rating of the selected button
        let selectedRating = index + 1
        
        if selectedRating == rating {
            //If the selected star represents the current rating, reset the rating to 0
            rating = 0
        }else{
            //Otherwise set the rating to the selected star
            rating = selectedRating
        }
    }


    private func updateButtonSelectionStates(){
        for (index, button) in ratingButtons.enumerated(){
            //If the index of a button is less than the rating, that button should be selected.
            button.isSelected = index < rating
        }
    }

}
