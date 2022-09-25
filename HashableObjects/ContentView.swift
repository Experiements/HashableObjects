//
//  ContentView.swift
//  HashableObjects
//
//  Created by Chris Hand on 9/25/22.
//

import SwiftUI

struct Student: Hashable {
    let name: String
}

struct ContentView: View {
    var body: some View {
        let students = [Student(name: "Chris"), Student(name: "Chris"), Student(name: "Eiko")]
        List {
            ForEach(students, id:\.self) {
                Text($0.name)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
