//
//  ContentView.swift
//  Pattern Editor
//
//  Created by mehmet Çelik on 19.03.2025.
//

import SwiftUI

struct ContentView: View {
    
    let n : Int
    @State private var name: String = "pattern"
    @State private var pattern : [[Bool]]
    init(n: Int) {
        self.n = n
        self._pattern = State(initialValue: Array(repeating: Array(repeating: false, count: n), count: n))
    }
    var body: some View {
        HStack {
        
            PatternEditor()
          
            
            CodePreview()
            
            
        }
        .padding()
        .frame(minWidth: 800, minHeight: 600)
        
    }
}

struct PatternEditor: View {
    var body: some View {
        Text("Pattern Editor")
    }
}

struct CodePreview: View {
    var body: some View {
        Text("Code Preview")
    }
}

#Preview {
    ContentView(n: 15)
}
