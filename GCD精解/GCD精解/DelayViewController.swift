//
//  DelayViewController.swift
//  GCD精解
//
//  Created by shen on 2018/9/28.
//  Copyright © 2018年 MT. All rights reserved.
//

import UIKit

/// 延时执行
class DelayViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let btn = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 30))
        btn.setTitle("3秒后输出", for: .normal)
        btn.backgroundColor = .blue
        btn.addTarget(self, action: #selector(printSomthing), for: .touchUpInside)
        self.view.addSubview(btn)
    }
    
    @objc func printSomthing() {
        print("点击了按钮")
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
            print("这句话是在点击按钮3秒之后输出的")
        }
        print("在主线程执行的任务，不被阻塞")
    }
}
