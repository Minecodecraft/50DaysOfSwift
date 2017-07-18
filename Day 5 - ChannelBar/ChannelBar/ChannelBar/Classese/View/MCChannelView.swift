//
//  MCChannelView.swift
//  ChannelBar
//
//  Created by Minecode on 2017/7/18.
//  Copyright © 2017年 Minecode. All rights reserved.
//

import UIKit

let kChannelMargin: CGFloat = 10

class MCChannelView: UIView {

    @IBOutlet weak var scrollView: UIScrollView!
    
    // 外界设置channel时，就会调用这个方法
    var channels: Array<String> = Array<String>() {
        didSet {
            setChannels(channels: channels)
        }
    }
    
    func setChannels(channels: Array<String>) {
        
        var offsetX: CGFloat = kChannelMargin
        
        for model in channels {
            let label = UILabel()
            
            label.text = model
            label.font = UIFont.systemFont(ofSize: 18)
            label.textColor = UIColor.black
            
            label.sizeToFit()
            label.font = UIFont.systemFont(ofSize: 14)
            
            var frame = label.frame
            frame.origin.x = offsetX
            frame.size.height = 35
            label.frame = frame
            
            self.scrollView.addSubview(label)
            
            offsetX += label.frame.size.width + kChannelMargin
        }
        
        // 设置滚动视图的滚动距离
        scrollView.contentSize = CGSize(width: offsetX, height: 35)
        
    }

}
