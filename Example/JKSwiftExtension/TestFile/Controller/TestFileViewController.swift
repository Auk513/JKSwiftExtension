//
//  TestFileViewController.swift
//  JKSwiftExtension_Example
//
//  Created by IronMan on 2020/11/25.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit

class TestFileViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "TestFile"
        self.view.backgroundColor = .white
        
        
        let label1 = UILabel(frame: CGRect(x: 0, y: 100, width: kScreenW, height: 30))
        label1.text = "H"
        label1.backgroundColor = .randomColor
        label1.textAlignment = .center
        self.view.addSubview(label1)
        
        
        let text = "2256"
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .right
        let attributedString = NSMutableAttributedString(string: text, attributes: [NSAttributedString.Key.kern: 20])
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: text.count))
        attributedString.addAttribute(NSAttributedString.Key.font, value: UIFont.systemFont(ofSize: 26), range: NSRange(location: 0, length: text.count))
        
        let size = JKContentSize.attributedStringSize(attributedString: attributedString, width: kScreenW, height: 30, font: UIFont.systemFont(ofSize: 26))
        
        let label = UILabel(frame: CGRect(x: (kScreenW - size.width) / 2.0 + 10, y: label1.jk.bottom + 10, width: size.width, height: size.height))
        label.attributedText = attributedString
        label.backgroundColor = .randomColor
        self.view.addSubview(label)
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        print("结果：\(test())")

    }
    
    func test() -> Bool {
        
        defer {
            print("结束执行函数------------")
        }
        
        print("开始执行函数------------")
        guard let result = try? MyFunc(param: false) else {
            print("异常")
            return false
        }
        print("正常:\(result)")
        return true
        
        /*
        do {
            try MyFunc(param: false)
            print("--🚀🚀🚀🚀🚀🚀---")
            return true
        } catch MyError.NormalError {
            print("有异常")
            return false
        } catch {
            print("其他的异常")
            return false
        }
        */
    }
}

/// 错误类型
enum MyError: Error {
    case DestroyError
    case NormalError
    case SimpleError
}

func MyFunc(param: Bool) throws -> String {
    if param {
        print("success")
        return "成功"
    } else {
        throw MyError.SimpleError
    }
}

class BaseCls {
    var age: Int?
    
    /// 指定初始化器
    init() {
        
    }
    
    init(param: Int) {
        print("BaseCls init \(param)")
    }
    
    // 提供一个便利构造方法
    convenience init(param: String) {
        self.init()
    }
}

// 此类中不进行任何构造方法的定义，默认会继承父类所有构造方法
class SubClsOne: BaseCls {
    
}

// 此类对父类的无参 init() 指定构造方法进行的覆写
class SubClsTwo: BaseCls {
    // 覆写了无参的 init() 构造方法，则不再继承父类其他构造方法
    override init() {
        super.init()
    }
}

// 这个类没有覆写父类的构造方法，但是通过函数的重载方式定义了自己的构造方法
class SubClsThree: BaseCls {
    /// 重写了一个新的构造方法，就不再继承父类的其他构造方法
    init(param: Bool) {
        super.init()
    }
}

//
class SubClsFour: BaseCls {
    var name: String
    ///
    override init(param: Int) {
        self.name = ""
        super.init(param: param)
        age = 10
    }
  
}
