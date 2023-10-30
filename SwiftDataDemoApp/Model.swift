//
//  Model.swift
//  SwiftDataDemoApp
//
//  Created by Михаил Куприянов on 30.10.23..
//

import SwiftUI
import SwiftData

@Model
class Student {
    var id: UUID
    var firstName: String
    var lastName: String
    var school: School
    
    init(id: UUID, firstName: String, lastName: String, school: School) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.school = school
    }
}

@Model
class School {
    var id: UUID
    var schoolName: String
    var courseName: String
    
    init(id: UUID, schoolName: String, courseName: String) {
        self.id = id
        self.schoolName = schoolName
        self.courseName = courseName
    }
}
