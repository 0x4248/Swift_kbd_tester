//
//  ContentView.swift
//  Swift_kbd_tester
//
//  Created by Lewis Evans on 11/10/2023.
//

import SwiftUI



struct ContentView: View {
    @State private var inputText = ""
    @State private var showingAlert = false
    var body: some View {
        VStack {
            HStack {
                Text("Swift Keyboard Tester")
                    .font(.title)
                    .padding()
                Image(systemName: "keyboard").font(.title)
            }
            // TextField("Enter text here", text: $inputText)
            //     .textFieldStyle(RoundedBorderTextFieldStyle())
            //     .padding()
            // Make this a TextEditor instead of a TextField
            TextEditor(text: $inputText)
                .padding()
            HStack {
                Button(action: {
                    UIPasteboard.general.string = self.inputText
                }) {
                    Image(systemName: "doc.on.doc")
                }
                .padding()
                
                Button(action: {
                    self.inputText += UIPasteboard.general.string ?? ""
                }) {
                    Image(systemName: "doc.on.clipboard")
                }
                .padding()
                
                Button(action: {
                    self.showingAlert = true
                }) {
                    // trash with red foreground
                    Image(systemName: "trash")
                        .foregroundColor(.red)
                }
                .alert(isPresented: $showingAlert) {
                    Alert(title: Text("Clear Input"),
                        message: Text("Are you sure you want to clear the input text?"),
                        primaryButton: .destructive(Text("Clear")) {
                            self.inputText = ""
                        },
                        secondaryButton: .cancel())
                }
                .padding()
            }
        }
    }
}

#Preview {
    ContentView()
}
