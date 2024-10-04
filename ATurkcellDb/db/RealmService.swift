//
//  RealmService.swift
//  ATurkcellDb
//
//  Created by Sefa Aycicek on 4.10.2024.
//

import UIKit
import RealmSwift

class RealmService : RealmServiceProtocol {
    var realm : Realm?  {
        let configuration = Realm.Configuration(schemaVersion: 2) // db modellerinin değiştirği her yeni versiyonda +1 yapmak lazım schemaVersion
        return try? Realm(configuration: configuration)
    }
    
    
    func getAllNotes() -> [NoteUIModel]? {
        var noteList = [NoteUIModel]()
        realm?.objects(NoteEntity.self ).forEach({ noteEntity in
            noteList.append(NoteUIModel(note: noteEntity))
        })
        return noteList
    }
    
    func insertNote(noteUIModel: NoteUIModel) {
        try? realm?.write {
            var noteEntity = NoteEntity()
            noteEntity.noteText = noteUIModel.noteText
            noteEntity.noteDate = noteUIModel.noteDate
            noteEntity.noteTitle = noteUIModel.noteTiltle
            noteEntity.identifier = noteUIModel.identifier
            realm?.add(noteEntity)
        }
    }
    
    func deleteNote(noteUIModel: NoteUIModel) {
        
    }
    

}

protocol RealmServiceProtocol {
    func getAllNotes() -> [NoteUIModel]?
    func insertNote(noteUIModel: NoteUIModel)
    func deleteNote(noteUIModel: NoteUIModel)
}
