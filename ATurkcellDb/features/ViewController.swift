//
//  ViewController.swift
//  ATurkcellDb
//
//  Created by Sefa Aycicek on 4.10.2024.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var txtNoteTitle: UITextField!
    @IBOutlet weak var txtNoteDetail: UITextView!
    @IBOutlet weak var txtDate: UITextField!
    var selectedDate : Date = Date()
    
    var datePicker = UIDatePicker()
    
    let viewModel = MainViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureDatePicker()
    }
    
    func configureDatePicker() {
        txtDate.inputView = datePicker
        datePicker.datePickerMode = .date
        datePicker.addTarget(self, action: #selector(datePickerValueChanged), for: .valueChanged)
        
        if #available(iOS 13.4, *) {
            datePicker.preferredDatePickerStyle = .wheels
        }
    }
    
    @objc func datePickerValueChanged() {
        selectedDate = datePicker.date
        txtDate.text = selectedDate.toString(format: .yearMonthDayNameFormat)
    }

    @IBAction func saveNote(_ sender: Any) {
        self.view.endEditing(true)
        let note = NoteUIModel(identifier: ObjectId.generate(),
                               noteText: txtNoteDetail.text ?? "",
                               noteTitle: txtNoteTitle.text ?? "",
                               noteDate: selectedDate)
        viewModel.addNote(note)
        
        viewModel.realmService.getAllNotes()?.forEach {
            print($0.noteText)
        }
        
    }
    
}

