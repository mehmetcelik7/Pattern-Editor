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
    
    var codeString : String {
"""
 case .\(name):
return [ 
\(formattedPoints)]
"""
        
    }
    var formattedPoints: String {
        var result = ""
        
        for i in 0..<n {
            for j in 0..<n  where pattern [i][j]{
                let x = j - n/2
                let y = i - n/2
                
                result += "\t(\(x),\(y)),\n"
                
            }
        }
        
        return result
    }
    init(n: Int) {
        self.n = n
        self._pattern = State(initialValue: Array(repeating: Array(repeating: false, count: n), count: n))
    }
    var body: some View {
        HStack {
        
            PatternEditorView(
                n: n,
                name: $name,
                pattern: $pattern
            )
          
            if name.isValidIdentifier {
                CodePreview(name: name, codeString: codeString)
            }
            
         
            
            
        }
        .padding()
        .frame(minWidth: 800, minHeight: 600)
        
    }
}


#Preview {
    ContentView(n: 15)
}
