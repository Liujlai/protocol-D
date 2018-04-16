//
//  LView.swift
//  protocol_D
//
//  Created by idea on 2018/4/13.
//  Copyright © 2018年 idea. All rights reserved.
//

import UIKit

protocol LViewDelegate:class {
    func toNext(lview:LView)
    func toNextInt(_ lview:LView,index:Int)
}

class LView: UIView {
 weak var lviewDelegate : LViewDelegate?
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.cyan
       
    }
    func awake() -> String {
        return "@@#@@@!"
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
         lviewDelegate?.toNextInt(self, index: 3)
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
         lviewDelegate?.toNext(lview:self)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
