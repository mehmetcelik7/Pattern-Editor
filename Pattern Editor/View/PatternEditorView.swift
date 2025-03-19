//
//  PatternEditorView.swift
//  Pattern Editor
//
//  Created by mehmet Çelik on 19.03.2025.
//

import SwiftUI

struct PatternEditorView: View {
    let n: Int
    @Binding var name: String
    @Binding var pattern: [[Bool]]
    
    var body: some View {
        VStack {
            Text("Pattern Editor")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text("Tap a cell to toggle its state")
                .font(.title2)
                .foregroundStyle(.secondary)
            
            VStack(alignment: .trailing) {
                HStack {
                    Text("Name:")
                    TextField(
                        "Enter pattern name",
                        text: $name
                    )
                    .padding(6)
                    .overlay {
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(
                                name.isEmpty ? Color.red : Color.gray,
                                lineWidth: name.isEmpty ? 3 : 1
                            )
                    }
                    .frame(minWidth: 300)
                    
                    Button(
                        "Clear",
                        systemImage: "arrow.uturn.backward") {
                            withAnimation {
                                pattern = Array(repeating: Array(repeating: false, count: n), count: n)
                            }
                        }.buttonStyle(.borderedProminent)
                        .tint(.purple)
                        .padding()
                }.font(.title2)
                
                if !name.isValidIdentifier {
                    Text("Invalid Identifier")
                        .font(.callout)
                        .bold()
                        .foregroundStyle(.red)
                        .padding([.horizontal, .bottom])
                }
            }
            
            PatternGrid(
                n: n,
                pattern: $pattern,
                enabled: name.isValidIdentifier
            )
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    PatternEditorView(
        n: 15,
        name: .constant("pattern"),
        pattern: .constant(Array(repeating: Array(repeating: false, count: 15), count: 15))
    )
}
