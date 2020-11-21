//
//  OnboardingScreens.swift
//  ChatMeUp
//
//  Created by Aaron Cleveland on 11/20/20.
//

import UIKit

@IBDesignable
class OnboardingScreens: UIView {
    static let ONBOARDING_ITEM_NIB = "OnboardingScreens"

    @IBOutlet var onboardingContent: UIView!
    @IBOutlet weak var onboardingBackground: UIView!
    @IBOutlet weak var onboardingTitle: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initWithNib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initWithNib()
    }
    
    convenience init(titleText: String? = "", background: UIColor? = .red) {
        self.init()
        onboardingTitle.text = titleText
        onboardingBackground.backgroundColor = background
    }
    
    fileprivate func initWithNib() {
        Bundle.main.loadNibNamed(OnboardingScreens.ONBOARDING_ITEM_NIB,
                                owner: self,
                                options: nil)
        onboardingContent.frame = bounds
        onboardingContent.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(onboardingContent)
    }

}
