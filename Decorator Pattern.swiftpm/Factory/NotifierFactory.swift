//
//  NotifierFactory.swift
//
//
//  Created by Nahidul Islam Raffi on 22/08/2024.
//

import Foundation

final class NotifierFactory {
    static let shared = NotifierFactory(channelManager: .init())
    
    typealias ChannelManager = ExtraNotifChannelManager
    
    private let channelManager: ChannelManager
    
    init(channelManager: ChannelManager) {
        self.channelManager = channelManager
    }
    
    typealias NotifierType = Notifier
    func buildNotifier() -> any NotifierType {
        var notifier = EmailNotifier() as NotifierType
        
        if channelManager.channels.contains(.facebook) {
            notifier = NotifierDecorator(wrappedNotifier: notifier) { _ in
                print("Sending message to Facebook")
            }
        }
        
        if channelManager.channels.contains(.teams) {
            notifier = NotifierDecorator(wrappedNotifier: notifier) { _ in
                print("Sending message to Teams")
            }
        }
        
        if channelManager.channels.contains(.slack) {
            notifier = NotifierDecorator(wrappedNotifier: notifier) { _ in
                print("Sending message to Slack")
            }
        }
        
        return notifier
    }
}
