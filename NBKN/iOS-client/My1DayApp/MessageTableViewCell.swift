//
//  MessageTableViewCell.swift
//  My1DayApp
//
//  Created by 清 貴幸 on 2015/04/24.
//  Copyright (c) 2015年 VOYAGE GROUP, inc. All rights reserved.
//

import UIKit

class MessageTableViewCell: UITableViewCell {
    @IBOutlet weak private var iconImageView: UIImageView!
    @IBOutlet weak private var messageLabel: UILabel!
    @IBOutlet weak private var dateLabel: UILabel!
    @IBOutlet weak private var nameLabel: UILabel!

    // Mission1-1 UILabel のインスタンス変数を追加
    
    override func prepareForReuse() {
        self.iconImageView.image = nil
        self.messageLabel.text = nil
        self.dateLabel.text = nil
        self.nameLabel.text = nil
        // Mission1-1 UILabel のインスタンス変数を初期化
    }
    
    func setupComponentsWithMessage(message: Message) {
        self.iconImageView.image = message.icon
        self.messageLabel.text = message.body
        // Abe dateFormatter
        var date_string:String = message.created_at
        let stringFormatter = NSDateFormatter()
        stringFormatter.locale = NSLocale(localeIdentifier: "ja_JP") // ロケールの設定
        stringFormatter.dateFormat = "yyyy'-'MM'-'dd'T'HH':'mm':'ssZZZZ" // 日付フォーマットの設定
        var exTime: NSDate! = stringFormatter.dateFromString(date_string)
        
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.locale = NSLocale(localeIdentifier: "ja_JP") // ロケールの設定
        dateFormatter.dateFormat = "HH:mm" // 日付フォーマットの設定
        
        self.dateLabel.text = dateFormatter.stringFromDate(exTime)
        // dateFormatter end.
        
        self.nameLabel.text = message.username
        // Mission1-1 UILabel のインスタンス変数に created_at の値を代入
    }
}
