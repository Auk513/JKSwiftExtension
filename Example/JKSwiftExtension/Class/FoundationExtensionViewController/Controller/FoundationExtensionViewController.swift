//
//  FoundationExtensionViewController.swift
//  JKSwiftExtension_Example
//
//  Created by IronMan on 2020/9/25.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit

class FoundationExtensionViewController: UIViewController {
    
    fileprivate static let FoundationExtensionViewControllerCellIdentifier = "FoundationExtensionViewControllerCellIdentifier"
    /// 资源数组
    fileprivate var dataArray = [Any]()
    /// 完成的类
    fileprivate var finishedDataArray: [String] = []
    lazy var tableView : UITableView = {
        
        let tableView = UITableView(frame:CGRect(x:0, y: 0, width: kScreenW, height: kScreenH - CGFloat(kNavFrameH)), style:.grouped)
        if #available(iOS 11, *) {
            tableView.estimatedSectionFooterHeight = 0
            tableView.estimatedSectionHeaderHeight = 0
            tableView.contentInsetAdjustmentBehavior = .never
        } else {
            automaticallyAdjustsScrollViewInsets = false
        }
        tableView.backgroundColor = UIColor.white
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        tableView.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: kScreenW, height: 0.01))
        tableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: kScreenW, height: 0.01))
        // 设置行高为自动适配
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(HomeViewCell.self, forCellReuseIdentifier: FoundationExtensionViewController.FoundationExtensionViewControllerCellIdentifier)
        // tableView.addWater(markText: "JKSwiftExtension", textColor: UIColor.randomColor(), font: UIFont.systemFont(ofSize: 12))
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.edgesForExtendedLayout = []
        self.view.backgroundColor = UIColor.green
  
        dataArray = ["Array+Extension", "Bundle+Extension", "UserDefaults+Extension", "CGRect+Extension", "Date+Extension", "NSObject+Extension", "String+Extension", "UIDevice+Extension", "UIFont+Extension", "Timer+Extension", "Int+Extension", "Double+Extension", "UInt+Extension", "Int64+Extension", "Float+Extension", "Bool+Extension", "CGFloat+Extension", "Character+Extension", "DateFormatter+Extension", "Dictionary+Extension", "FileManager+Extension", "URL+Extension", "NSDecimalNumberHandler+Extension", "UIColor+Extension"]
        finishedDataArray = ["String+Extension", "Date+Extension", "Array+Extension", "Bundle+Extension", "NSObject+Extension", "UserDefaults+Extension", "UIFont+Extension", "Float+Extension", "Double+Extension", "CGFloat+Extension", "Int+Extension", "Int64+Extension", "UInt+Extension", "Character+Extension", "Bool+Extension", "UIColor+Extension"]
        initUI()
    }
    
    /// 创建控件
    private func initUI() {
        view.addSubview(tableView)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension FoundationExtensionViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FoundationExtensionViewController.FoundationExtensionViewControllerCellIdentifier, for: indexPath) as! HomeViewCell
        let cellName = dataArray[indexPath.row] as! String
        cell.contentLabel.text = "\(indexPath.row + 1)：\(cellName)"
        cell.contentLabel.textColor = finishedDataArray.contains(cellName) ? UIColor.hexStringColor(hexString: "#006400") : UIColor.c444444
        // cell.lineView.isHidden = indexPath.row == dataArray.count - 1 ? true : false
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionView = UIView(frame: CGRect(x: 0, y: 0, width: kScreenW, height:0.01))
        return sectionView
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let sectionFootView = UIView(frame: CGRect(x: 0, y: 0, width: kScreenW, height: 0.01))
        return sectionFootView
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let cellName = dataArray[indexPath.row] as! String
        let vcName = cellName.removeSomeStringUseSomeString(removeString: "+") + "ViewController"
        guard let vc = vcName.toViewController() else {
            return
        }
        vc.title = cellName
        navigationController?.pushViewController(vc, animated: true)
    }
}
