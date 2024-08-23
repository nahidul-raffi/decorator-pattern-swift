//
//  ExtraNotifChannelOptions.swift
//
//
//  Created by Nahidul Islam Raffi on 22/08/2024.
//

import Foundation

struct ExtraNotifChannelOptions: OptionSet {
    let rawValue: Int
    
    static let teams = ExtraNotifChannelOptions(rawValue: 1 << 0)
    static let facebook = ExtraNotifChannelOptions(rawValue: 1 << 1)
    static let slack = ExtraNotifChannelOptions(rawValue: 1 << 2)
}
