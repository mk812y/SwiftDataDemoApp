//
//  AddStudentView.swift
//  SwiftDataDemoApp
//
//  Created by Михаил Куприянов on 30.10.23..
//

import SwiftUI
import TipKit

struct AddStudentView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var schoolName: String = ""
    @State private var courseName: String = ""
    @State private var showingAlert = false
    var bookmarkTip = BookmarkTip()
    
    var body: some View {
        VStack(spacing: 10) {
            TextField("First Name", text: $firstName)
                .textFieldStyle(.roundedBorder)
            TextField("Last Name", text: $lastName)
                .textFieldStyle(.roundedBorder)
            TextField("School Name", text: $schoolName)
                .textFieldStyle(.roundedBorder)
            TextField("Course Name", text: $courseName)
                .textFieldStyle(.roundedBorder)
            Spacer()
            VStack {
                TipView(bookmarkTip, arrowEdge: .bottom)
                Button(action: {}) {
                    Label("Bookmark", systemImage: "star")
                }
            }
//            .task {
//                try? await Tips.configure {
//                    DisplayFrequency(.immediate)
//                    DatastoreLocation(.applicationDefault)
//                }
//            }
        }
        .padding(20)
        .navigationTitle("Add student")
        .toolbar(content: {
            Button(action: {
                let student = Student(firstName: firstName, lastName: lastName,
                                      school: School(schoolName: schoolName, courseName: courseName))
                modelContext.insert(student)
                presentationMode.wrappedValue.dismiss()
            }, label: {
                Text("Add student")
            })
            .disabled(firstName.count < 2 || firstName.count < 2 || schoolName.isEmpty)
        })
    }
}

struct BookmarkTip: Tip {
    var asset: Image? {
        Image(systemName: "star")
    }
    var title: Text {
        Text("Click and Bookmark")
    }
    var message: Text? {
        Text("Save this page and return here anytime.")
    }
}

#Preview {
    AddStudentView()
}




