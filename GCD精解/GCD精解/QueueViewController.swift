//
//  QueueViewController.swift
//  GCD精解
//
//  Created by shen on 2018/9/28.
//  Copyright © 2018年 MT. All rights reserved.
//

import UIKit

/// 队列
class QueueViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        test1()
//        test2()
//        test3()
//        test4()
//        test5()
//        test6()
//        test7()
//        test8()
        
        DispatchQueue.global().async {
            print("currentThread: \( Thread.current)")
            self.test8()
        }
        
//        DispatchQueue.global().sync {
//            print("currentThread: \( Thread.current)")
//            self.test7()
//        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /// 这是用于模拟耗时操作的输出
    ///
    /// - Parameter number: 第几个加入的任务
    func readData(_ number: Int) {
        print(Thread.current)
        print("start" + "\(number)")
        sleep(2)
        print("end " + "\(number)")
    }
    
    /// 串行队列，同步执行
    func test1() {
        let serialQueue = DispatchQueue(label: "com.MT.serialQueue")
        serialQueue.sync {
            readData(0)
        }
        serialQueue.sync {
            readData(1)
        }
        print("当前线程执行的任务")
    }
    
    /// 串行队列，异步执行
    func test2() {
        let serialQueue = DispatchQueue(label: "com.MT.serialQueue")
        serialQueue.async {
            self.readData(0)
        }
        serialQueue.async {
            self.readData(1)
        }
        print("当前线程执行的任务")
    }
    
    /// 并发队列，同步执行
    func test3() {
        let concurrntQueue = DispatchQueue(label: "com.MT.concrrentQueue", attributes: .concurrent)
        concurrntQueue.sync {
            self.readData(0)
        }
        concurrntQueue.sync {
            self.readData(1)
        }
        concurrntQueue.sync {
            self.readData(2)
        }
        print("当前线程执行的任务")
    }

    /// 并发队列，异步执行
    func test4() {
        let concurrntQueue = DispatchQueue(label: "com.MT.concrrentQueue", attributes: .concurrent)
        concurrntQueue.async {
            self.readData(0)
        }
        concurrntQueue.async {
            self.readData(1)
        }
        concurrntQueue.async {
            self.readData(2)
        }
        print("当前线程执行的任务")
    }
    
    /// 全局队列，同步执行
    func test5() {
        let globalQueue = DispatchQueue.global()
        globalQueue.sync {
            self.readData(0)
        }
        globalQueue.sync {
            self.readData(1)
        }
        print("当前线程执行的任务")
    }
    
    /// 全局队列，异步执行
    func test6() {
        let globalQueue = DispatchQueue.global()
        globalQueue.async {
            self.readData(0)
        }
        globalQueue.async {
            self.readData(1)
        }
        globalQueue.async {
            self.readData(2)
        }
        print("当前线程执行的任务")
    }
    
    /// 主队列，同步执行
    func test7() {
        let mainQueue = DispatchQueue.main
        mainQueue.sync {
            self.readData(0)
        }
        mainQueue.sync {
            self.readData(1)
        }
        print("当前线程执行的任务")
    }

    /// 主队列，异步执行
    func test8() {
        let mainQueue = DispatchQueue.main
        mainQueue.async {
            self.readData(0)
        }
        mainQueue.async {
            self.readData(1)
        }
        mainQueue.async {
            self.readData(2)
        }
        print("当前线程执行的任务")
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
