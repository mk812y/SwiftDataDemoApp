//
//  EditStudentDetailsView.swift
//  SwiftDataDemoApp
//
//  Created by Михаил Куприянов on 30.10.23..
//

import SwiftUI
import SwiftData

struct EditStudentDetailsView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var student: Student
    
    var body: some View {
        VStack(spacing: 10) {
            TextField("First Name", text: $student.firstName)
                .textFieldStyle(.roundedBorder)
            TextField("Last Name", text: $student.lastName)
                .textFieldStyle(.roundedBorder)
            TextField("School Name", text: $student.school.schoolName)
                .textFieldStyle(.roundedBorder)
            TextField("Course Name", text: $student.school.courseName)
                .textFieldStyle(.roundedBorder)
            Spacer()
        }
        .padding(20)
        .navigationTitle("Edit Details")
        .toolbar {
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }, label: {
                Text("Update")
            })
        }
    }
}

//#Preview {
//    EditStudentDetailsView(student: Student(firstName: "Pol", lastName: "Lol", school: School(schoolName: "Ololol", courseName: "Pololol")))
//}
