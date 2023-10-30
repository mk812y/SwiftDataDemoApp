//
//  StudentListView.swift
//  SwiftDataDemoApp
//
//  Created by Михаил Куприянов on 30.10.23..
//

import SwiftUI
import SwiftData

struct StudentListView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var students: [Student]
    
    var body: some View {
        VStack {
            if students.isEmpty {
                Text("swiftData Demo")
                    .bold()
                    .font(.title)
                NavigationLink {
                    AddStudentView()
                } label: {
                    Text("Click here to add a student")
                        .bold()
                        .font(.title)
                }
                .padding(8)
            } else {
                List(students) { student in
                    NavigationLink {
                        EditStudentDetailsView(student: student)
                    } label: {
                        VStack(alignment: .leading) {
                            Text("\(student.firstName) \(student.lastName)")
                                .bold()
                                .font(.headline)
                                .padding(8)
                            Text("School: \(student.school.schoolName)")
                                .fontWeight(.regular)
                                .font(.caption)
                                .padding(8)
                            Text("Course Name: \(student.school.courseName)")
                                .fontWeight(.regular)
                                .font(.caption2)
                                .padding(8)
                        }
                        .swipeActions {
                            Button("Delete", role: .destructive) {
                                modelContext.delete(student)
                            }
                        }
                    }
                }
                NavigationLink {
                    AddStudentView()
                } label: {
                    Text("Add New Student")
                        .fontWeight(.bold)
                        .font(.title)
                }
                .padding(8)
            }
        }
    }
}

#Preview {
    StudentListView()
        .modelContainer(for: Student.self, inMemory: true)
}
