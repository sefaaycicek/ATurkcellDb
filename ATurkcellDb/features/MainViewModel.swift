//
//  MainViewModel.swift
//  ATurkcellDb
//
//  Created by Sefa Aycicek on 4.10.2024.
//

import UIKit

class MainViewModel {
    let realmService : RealmServiceProtocol
    init (realmService : RealmServiceProtocol = RealmService()) {
        self.realmService = realmService
    }
    
    func fetchData() -> [NoteUIModel] {
        return realmService.getAllNotes() ?? []
    }
    
    func addNote(_ note : NoteUIModel) {
        realmService.insertNote(noteUIModel: note)
    }
}
