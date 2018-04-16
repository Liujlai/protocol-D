//
//  ViewController.swift
//  protocol_D
//
//  Created by idea on 2018/4/13.
//  Copyright © 2018年 idea. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var kview: LView = {[unowned self] in
        let kview = LView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height/3))
        kview.lviewDelegate = self
        return kview
        }()
//    开关
    var uiswitch:UISwitch!
//    进度条
    var proView : UIProgressView!
//    滑块
    var slider : UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(kview)
        let a:String = kview.awake()
        print(a+"@")
        ISswitch()
        segmented()
        progress()
        sliderUI()
        // Do any additional setup after loading the view, typically from a nib.
    }
    //    开关按钮
    func ISswitch(){
        uiswitch = UISwitch()
        uiswitch.center = CGPoint(x: 100, y: 50)
        uiswitch.isOn = true
        uiswitch.addTarget(self, action: #selector(switchChange), for: .valueChanged)
        self.view.addSubview(uiswitch)
    }
    //    分段选择控件
    func segmented() {
        let items = ["选项一","选项二","选项三"]
        let seg = UISegmentedControl(items: items)
        seg.center = self.view.center
        //        默认选中第三个
        seg.selectedSegmentIndex = 2
        seg.addTarget(self, action: #selector(segChange(_:)), for: .valueChanged)
        self.view.addSubview(seg)
    }
    //    进度条
    func progress() {
        proView = UIProgressView(progressViewStyle: .default)
        proView.center = self.kview.center
        proView.progress = 0.5
        self.view.addSubview(proView)
    }
//    滑块
    func sliderUI(){
        slider = UISlider(frame: CGRect(x: 0, y: 0, width: 300, height: 20))
        slider.center = CGPoint(x: UIScreen.main.bounds.size.width/2, y: 300)
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.value = 46
        //设置滑块的图片
        slider.setThumbImage(UIImage(named:"icon_wo_kefu"),for: .normal)
        //设置滑块右边部分的图片
        self.view.addSubview(slider)
    }
    
    @objc func switchChange(){
        print(uiswitch.isOn)
        
        //////进度条
        //        设置进度
        proView.setProgress(0.8, animated:true)
        //        设置颜色
        proView.progressTintColor = UIColor.green
        proView.trackTintColor = UIColor.yellow
        //        设置进度条纵向高度
        proView.transform = CGAffineTransform(scaleX: 1.0, y: 6.0)
        
        //////滑块
        slider.setValue(80, animated: true)
//        滑块两边的颜色
        slider.minimumTrackTintColor = UIColor.red
        slider.maximumTrackTintColor = UIColor.purple
//        滑块两边的图标
        slider.minimumValueImage = UIImage(named:"icon_wo_kefu")
        slider.maximumValueImage = UIImage(named:"icon_wo_notice")
     
    }
    @objc func segChange(_ seg:UISegmentedControl){
        //        修改选项颜色
        seg.tintColor = UIColor.red
        //        改文字
        seg.setTitle("red", forSegmentAt: 2)
        print(seg.selectedSegmentIndex,"###",seg.titleForSegment(at: seg.selectedSegmentIndex)!)
    }
    
}
extension ViewController:LViewDelegate{
    func toNextInt(_ lview: LView, index: Int) {
        print("😦",index)
    }
    
    func toNext(lview: LView) {
        print("~~~~\(LView())")
        self.present(AViewController(), animated: true, completion: nil)
    }
    
    
}
