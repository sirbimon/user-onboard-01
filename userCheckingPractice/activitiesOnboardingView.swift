//
//  activitiesOnboardingView.swift
//  userCheckingPractice
//
//  Created by Bimonaretga on 11/14/17.
//  Copyright © 2017 moeCodes. All rights reserved.
//

import Foundation
import UIKit


class activitiesOnboardingView: UIView {

    @IBOutlet weak var explanationLabel: UILabel!
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var upArrowImg: UIImageView!
    @IBOutlet weak var downArrowImg: UIImageView!
    
    
    var leftAnchorConstraint: NSLayoutConstraint!
    var activityPosition = ActivitiesViewPosition.Left
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        
        print("view loaded")
        Bundle.main.loadNibNamed("activitiesOnboardingView", owner: self, options: nil)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(contentView)
        leftAnchorConstraint = contentView.leftAnchor.constraint(equalTo: self.leftAnchor)
        leftAnchorConstraint.isActive = true
        contentView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        contentView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        explanationLabel.translatesAutoresizingMaskIntoConstraints = false
        explanationLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        explanationLabel.centerXAnchor.constraint(equalTo: contentView.rightAnchor, constant: (contentView.bounds.width / 2) ).isActive = true
        
        
    }
    
    @IBAction func buttonTapped(_ sender: Any) {
        leftAnchorConstraint.constant = -(contentView.bounds.width)
    }
    
    func animateLeft() {
        if activityPosition == .Left {
            return
        } else {
            UIView.animate(withDuration: 0.7, animations: {
                self.leftAnchorConstraint.constant = 0
                self.layoutIfNeeded()
            })
            activityPosition = ActivitiesViewPosition.Left
        }
    }
    
    func animateRight() {
        if activityPosition == .Right {
            return
        } else {
            UIView.animate(withDuration: 0.7, animations: {
                self.leftAnchorConstraint.constant = -(self.contentView.bounds.width)
                self.layoutIfNeeded()
            })
            activityPosition = ActivitiesViewPosition.Right
        }
    }
}

enum ActivitiesViewPosition {
    case Left, Right
}

