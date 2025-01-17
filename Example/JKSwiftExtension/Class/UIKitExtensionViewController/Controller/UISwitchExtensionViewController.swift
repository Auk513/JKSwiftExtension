//
//  UISwitchExtensionViewController.swift
//  JKSwiftExtension_Example
//
//  Created by IronMan on 2020/11/9.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit

class UISwitchExtensionViewController: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        headDataArray = ["一、基本的扩展"]
        dataArray = [["开关切换", "开关事件"]]
    }
}

// MARK: - 一、一、基本的扩展
extension UISwitchExtensionViewController {
    
    // MARK: 1.2、开关事件
    @objc func test12() {
        let sh = UISwitch(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        sh.backgroundColor = .brown
        sh.jk.setHandle { (result) in
            guard let weakResult = result else { return }
            print("开关的状态", "\(weakResult)")
        }
        sh.addTo(self.view)
        
        JKAsyncs.asyncDelay(10, {
        }) {
            sh.removeFromSuperview()
        }
    }
    
    // MARK: 1.1、开关切换
    @objc func test11() {
        let sh = UISwitch(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        sh.backgroundColor = .brown
        sh.addTo(self.view)
        
        JKAsyncs.asyncDelay(2, {
        }) {
            sh.jk.toggle()
            JKAsyncs.asyncDelay(5, {
            }) {
                sh.removeFromSuperview()
            }
        }
        
    }
    
}
