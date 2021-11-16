//
//  KeyboardAccessory.swift
//  JKSwiftExtension
//
//  Created by IronMan on 2020/9/25.
//

import UIKit

public protocol KeyboardAccessoryDelegate: class {
    func keyboardAccessoryDone()
}

public extension KeyboardAccessoryDelegate {
    func keyboardAccessoryDone() {}
}

@available(iOSApplicationExtension, unavailable, message: "This method is NS_EXTENSION_UNAVAILABLE.")
public class KeyboardAccessory: UIView {
    public weak var delegate: KeyboardAccessoryDelegate?
    public var doneBtn: UIButton = {
        let doneBtn = UIButton(type: .system).title("完成").font(UIFont.systemFont(ofSize: 13))
        doneBtn.addTarget(self, action: #selector(done), for: .touchUpInside)
        return doneBtn
    }()
    
    public init() {
        super.init(frame: CGRect(x: 0, y: 0, width: jk_kScreenW, height: 36))
        backgroundColor = .white
        doneBtn.frame = CGRect(x: jk_kScreenW - 50, y: 0, width: 50, height: self.jk.height)
        doneBtn.addTo(self)
        let line = UIView().backgroundColor(UIColor.hexStringColor(hexString: "#E6E6E6"))
        line.frame = CGRect(x: 0, y: 0, width: self.jk.width, height: 1)
        line.addTo(self)
    }
    
    @available(iOSApplicationExtension, unavailable, message: "This method is NS_EXTENSION_UNAVAILABLE.")
    @objc func done() {
        if let _delegate = delegate {
            _delegate.keyboardAccessoryDone()
        } else {
            UIApplication.shared.keyWindow?.endEditing(true)
        }
    }
    
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

