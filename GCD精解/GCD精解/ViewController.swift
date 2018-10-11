//
//  ViewController.swift
//  GCD精解
//
//  Created by shen on 2018/9/28.
//  Copyright © 2018年 MT. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    let dataSource = [("基础用法", ["延时执行", "倒计时"]), ("多线程相关", ["队列", "线程基础", "线程组Group", "线程锁"])]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.tableView.register(UITableViewHeaderFooterView.self, forHeaderFooterViewReuseIdentifier: "headerView")
        self.tableView.tableFooterView = UIView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return dataSource.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource[section].1.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = dataSource[indexPath.section].1[indexPath.row]
        cell.textLabel?.textColor = .gray
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "headerView")
        headerView?.textLabel?.text = dataSource[section].0
        return headerView
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch (indexPath.section, indexPath.row) {
        case (0, 0): // 延时执行
            self.navigationController?.pushViewController(DelayViewController(), animated: true)
        case (0, 1): // 倒计时
            self.navigationController?.pushViewController(CountDownViewController(), animated: true)
        case (1, 0): // 队列
            self.navigationController?.pushViewController(QueueViewController(), animated: true)
        default:
            break
        }
    }
}

