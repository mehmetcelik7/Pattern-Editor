//
//  CodePreview.swift
//  Pattern Editor
//
//  Created by mehmet Çelik on 19.03.2025.
//

import SwiftUI

struct CodePreview: View {
//    @Binding var name: String
    let name: String
    let codeString: String
 
    
    var body: some View {
        Group {
            
            if name.isEmpty {
                ContentUnavailableView("Name your pattern", image: "pencil")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.red.opacity(0.2))
            }else{
                ScrollView {
                    HStack {
                        Text(codeString)
                            .font(.largeTitle)
                            .multilineTextAlignment(.leading)
                        Spacer()
                    }
                }.padding()
                    .background(Color.blue.opacity(0.2))
                    .clipShape(.rect(cornerRadius: 15))
                    .onDrag {
                        NSItemProvider(object: codeString as NSItemProviderWriting)
                    }
            }
            
        }
    }
}

#Preview {
    CodePreview(name: "pattern ", codeString:
"""
if name.isEmpty {
    ContentUnavailableView("Name your pattern", image: "pencil")
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.red.opacity(0.2))
}else{
    ScrollView {
        Text(codeString)
            .font(.largeTitle)
            .multilineTextAlignment(.leading)
    }.padding()
        .background(Color.blue.opacity(0.2))
        .clipShape(.rect(cornerRadius: 15))
}
"""

    )
}
