//
//  NotifierDecorator.swift
//
//
//  Created by Nahidul Islam Raffi on 22/08/2024.
//

import Foundation

final class NotifierDecorator: Notifier {
    typealias SendingClosure = (String) -> Void
    
    let wrappedNotifier: any Notifier
    let sendingClosure: SendingClosure
    
    init(
        wrappedNotifier: any Notifier,
        sendingClosure: @escaping SendingClosure
    ) {
        self.wrappedNotifier = wrappedNotifier
        self.sendingClosure = sendingClosure
    }
    
    func send(message: String) {
        sendingClosure(message)
        wrappedNotifier.send(message: message)
    }
}
