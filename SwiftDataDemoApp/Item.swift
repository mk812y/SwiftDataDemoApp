//
//  Item.swift
//  SwiftDataDemoApp
//
//  Created by Михаил Куприянов on 30.10.23..
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
