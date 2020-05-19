//
//  ViewController.swift
//  PushNotes
//
//  Created by Chris Mercer on 19/05/2020.
//  Copyright © 2020 Chris Mercer. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var notes = [Note]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }

    @IBAction func composeButtonClicked(_ sender: Any) {
        AlertService.composeNote(in: self) { (note) in
            self.insertNote(note: note)
        }
    }
    
    func insertNote(note: Note) {
        notes.insert(note, at: 0)
        tableView.reloadData()
    }
    
}

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard indexPath.row <= notes.count, let note = notes[indexPath.row] as Note? else { return UITableViewCell() }
        let cell = UITableViewCell()
        cell.textLabel?.text = note.title
        return cell
    }
    
}
