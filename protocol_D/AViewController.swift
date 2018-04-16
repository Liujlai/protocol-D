//
//  AViewController.swift
//  protocol_D
//
//  Created by idea on 2018/4/16.
//  Copyright © 2018年 idea. All rights reserved.
//

import UIKit

class AViewController: UIViewController {
//    选择框
    var pickerView:UIPickerView!
    override func viewDidLoad() {
        super.viewDidLoad()

        pickerView  = UIPickerView()
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerView.selectRow(1, inComponent: 0, animated: true)
        self.view.addSubview(pickerView)
        self.view.backgroundColor = UIColor.white
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let message = String(pickerView.selectedRow(inComponent: 0))+"~"+String(pickerView.selectedRow(inComponent: 1))+"~"+String(pickerView.selectedRow(inComponent: 2))
        print(message)
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.present(BViewController(), animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
extension AViewController:UIPickerViewDelegate{
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(row)+" "+String(component)
    }
    
}
extension AViewController :UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 6
    }
}
