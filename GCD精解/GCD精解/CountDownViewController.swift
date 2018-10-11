//
//  CountDownViewController.swift
//  GCD精解
//
//  Created by shen on 2018/9/28.
//  Copyright © 2018年 MT. All rights reserved.
//

import UIKit

/// 倒计时
class CountDownViewController: BaseViewController {

    lazy var button: UIButton = {
        let btn = UIButton(frame: CGRect(x: 50, y: 100, width: 200, height: 30))
        btn.setTitle("点击开始倒计时", for: .normal)
        btn.backgroundColor = .blue
        btn.addTarget(self, action: #selector(startCountDown), for: .touchUpInside)
        return btn
    }()
    
    /// 倒计时总时长
    var totalTime: TimeInterval = 60
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.addSubview(self.button)
    }
    
    @objc func startCountDown() {
        print("开始倒计时")
        self.button.isEnabled = false
        let endTime = NSDate.init(timeIntervalSinceNow: totalTime)
        
        // 创建一个倒计时, 指定queue为global，EventHandler在global线程执行
        let timer = DispatchSource.makeTimerSource(flags: .init(rawValue: 0), queue: DispatchQueue.global())
        timer.schedule(deadline: .now(), repeating: 1)
        // 比如下面这个方法的意思就是1秒后开始倒计时，每1秒重复执行，容差10毫秒
        // timer.schedule(deadline: .now() + 1, repeating: 1, leeway: .milliseconds(10))
        timer.setEventHandler {
             let interval = Int(endTime.timeIntervalSinceNow)
            
            if interval <= 0 {
                timer.cancel()
                DispatchQueue.main.async {
                    self.button.setTitle("点击开始倒计时", for: .normal)
                    self.button.isEnabled = true
                }
            } else {
                print("还有：" + "\(interval)")
                DispatchQueue.main.async {
                    self.button.setTitle("\(interval)", for: .normal)
                }
            }
        }
        timer.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
