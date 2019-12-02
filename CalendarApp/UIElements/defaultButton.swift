//
//  defaultButton.swift
//  CalendarApp
//
//  Created by Caspar van Boom on 01/12/2019.
//  Copyright © 2019 Caspar van Boom. All rights reserved.
//

import UIKit

@IBDesignable
class defaultButton: UIButton {
    
    override init(frame: CGRect){
        super.init(frame: frame)
    }

    required init?(aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setup()
    }

    func setup() {
        self.clipsToBounds = true
        self.layer.cornerRadius = 15.0
        self.backgroundColor = UIColor.red
        self.setTitleColor(UIColor.white, for: .normal)
    }
    
}
