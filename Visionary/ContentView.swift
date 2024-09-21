//
//  ContentView.swift
//  Visionary
//
//  Created by Silverstar A. Carlson on 25/07/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            MainMenu()
            NewProject()
        }
    }
}

struct MainMenu: View {
    var body: some View {
        Form {
            Section {
                NavigationLink("My Projects") {
                    MyProjects()
                }
                NavigationLink("New Project") {
                    NewProject()
                }
            }
            Section {
                NavigationLink("Visionary Account") {
                    VisionaryAccount()
                }
                NavigationLink("Settings") {
                    AppSettings()
                }
            }
        }
        .navigationTitle("Visionary")
    }
}

struct MyProjects: View {
    var body: some View {
        VStack {
            Text("You'll be able to save projects and see them here in a later beta version.\nFor now, tap \"New Project\" in the Visionary menu.")
                .multilineTextAlignment(.center)
        }
        .padding()
        .navigationTitle("My Projects")
    }
}

struct NewProject: View {
    @State private var projectName: String = ""
    @State private var width: Int = 1920
    @State private var height: Int = 1080
    @State private var fps: Int = 60
    
    var body: some View {
        Form {
            if #available(iOS 15.0, *) {
                Section("Project Name") {
                    TextField("Untitled Video", text: $projectName)
                }
            } else {
                Section() {
                    TextField("Project Name", text: $projectName)
                }
            }
            
            if #available(iOS 15.0, *) {
                Section("Project Settings") {
                    Stepper("Width: \(width)", value: $width, in: 8...8192)
                    Stepper("Height: \(height)", value: $height, in: 8...8192)
                    Stepper("Frames Per Second: \(fps)", value: $fps, in: 1...240)
                }
            } else {
                Section {
                    Stepper("Width: \(width)", value: $width, in: 8...8192)
                    Stepper("Height: \(height)", value: $height, in: 8...8192)
                    Stepper("Frames Per Second: \(fps)", value: $fps, in: 1...240)
                }
            }
            NavigationLink("Create Project") {
                EditorView(width: CGFloat(width), height: CGFloat(height))
            }
        }
        .padding()
        .navigationTitle("New Project")
    }
}

struct VisionaryAccount: View {
    var body: some View {
        VStack {
            Text("With a Visionary account, you'll be able to edit your projects without having to use the same device to edit the project you've created in that device!\n\nThis feature isn't available yet.")
                .multilineTextAlignment(.center)
        }
        .padding()
    }
}

struct AppSettings: View {
    @State private var projectName: String = ""
    @State private var width: Int = 1920
    @State private var height: Int = 1080
    @State private var framesPerSecond: Int = 60
    
    var body: some View {
        Form {
            Section {
                NavigationLink("Default Project Settings") {
                    NewProject()
                }
            }
        }
        .padding()
        .navigationTitle("Settings")
    }
}

#Preview {
    ContentView()
}
