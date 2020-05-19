//
//  AlertService.swift
//  PushNotes
//
//  Created by Chris Mercer on 19/05/2020.
//  Copyright © 2020 Chris Mercer. All rights reserved.
//

import UIKit

class AlertService {
    private init() {}
    
    static func composeNote(in viewController: UIViewController, completion: @escaping (Note) -> Void) {
        let alert = UIAlertController(title: "New Note", message: "What's on your mind?", preferredStyle: .alert)
        alert.addTextField { (titleTF) in
            titleTF.placeholder = "Title"
        }
        let post = UIAlertAction(title: "Post", style: .default) { (_) in
            guard let title = alert.textFields?.first?.text else { return }
            let note = Note(title: title)
            completion(note)
        }
        alert.addAction(post)
        viewController.present(alert, animated: true)
    }
}
