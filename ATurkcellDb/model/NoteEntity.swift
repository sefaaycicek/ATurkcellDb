//
//  NoteEntity.swift
//  ATurkcellDb
//
//  Created by Sefa Aycicek on 4.10.2024.
//

import UIKit
import RealmSwift

class NoteEntity: Object {
    @Persisted(primaryKey: true) var identifier : ObjectId
    @Persisted(indexed: true) var noteText : String = ""
    @Persisted var noteTitle : String = ""
    @Persisted var noteDate : Date = Date()
    
    override class func primaryKey() -> String? {
        return "identifier"
    }
}

class NoteUIModel {
    var identifier : ObjectId
    var noteText : String = ""
    var noteTiltle : String = ""
    var noteDate : Date = Date()
    
    init (identifier: ObjectId, noteText: String, noteTitle: String, noteDate: Date) {
        self.identifier = identifier
        self.noteText = noteText
        self.noteTiltle = noteTitle
        self.noteDate = noteDate
    }
    
    init(note: NoteEntity) {
        self.identifier = note.identifier
        self.noteText = note.noteText
        self.noteTiltle = note.noteTitle
        self.noteDate = note.noteDate
    }
}
