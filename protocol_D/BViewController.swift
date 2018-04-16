//
//  BViewController.swift
//  protocol_D
//
//  Created by idea on 2018/4/16.
//  Copyright © 2018年 idea. All rights reserved.
//

import UIKit

class BViewController: UIViewController {

    var sv:UIScrollView!
    var pc :UIPageControl!
    override func viewDidLoad() {
        super.viewDidLoad()

        sv = UIScrollView()
        sv.delegate = self
        sv.frame = self.view.bounds
//       contentSize 可滚动的区域，宽度为屏幕的3倍，说明可以左右滑动
        sv.contentSize = CGSize(width: UIScreen.main.bounds.size.width*3, height: UIScreen.main.bounds.size.width)
//        整页平移是否开启
        sv.isPagingEnabled = true
//        隐藏滚动条
        sv.showsVerticalScrollIndicator = false
        sv.showsHorizontalScrollIndicator = false
        self.view.addSubview(sv)
        self.view.backgroundColor = UIColor.white
        setupNumofPages()
        setupPC()
    }
//    设置UIPageControl
    func setupPC(){
        pc = UIPageControl()
        pc.frame = CGRect(x: UIScreen.main.bounds.size.width/2-25, y: UIScreen.main.bounds.size.height-50, width: 50, height: 30)
        pc.backgroundColor = UIColor.clear
//        设置点的颜色
        pc.pageIndicatorTintColor = UIColor.purple
        pc.currentPageIndicatorTintColor = UIColor.yellow
        pc.numberOfPages = 3
        pc.addTarget(self, action: #selector(pcChanged(_ :)), for: .valueChanged)
        self.view.addSubview(pc)
    }
    
//    设置子页面
    func setupNumofPages(){
        for i in 0..<3{
            let v = ViewController()
            v.view.frame = CGRect(x: UIScreen.main.bounds.size.width*CGFloat(i), y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
            sv.addSubview(v.view)
        }
    }
    @objc func pcChanged(_ sender:UIPageControl){
        var frame = sv.frame
        frame.origin.x = frame.size.width*CGFloat(sender.currentPage)
        frame.origin.y = 0
        sv.scrollRectToVisible(frame, animated: true)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
extension BViewController :UIScrollViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        contentOffset当前显示区域的顶点相对于frame顶点的偏移量
        print("x:\(scrollView.contentOffset.x)\ny:\(scrollView.contentOffset.y)")
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let page = Int(scrollView.contentOffset.x/scrollView.frame.size.width)
        pc.currentPage = page
    }
}
