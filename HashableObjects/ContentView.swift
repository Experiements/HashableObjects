//
//  ContentView.swift
//  HashableObjects
//
//  Created by Chris Hand on 9/25/22.
//

import SwiftUI

struct ContentView: View {

    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var projects: FetchedResults<Projects>
    
    var body: some View {
        VStack {
            List(projects, id:\.self) { project in
                Text(project.name)
            }
            
            Button("Add") {
                let project = Projects(context: moc)
                project.name = "My New Project"
            }
            
            Button("Save") {
                do {
                    try moc.save()
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
