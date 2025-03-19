//
//  File.swift
//  Pattern Editor
//
//  Created by mehmet Çelik on 19.03.2025.
//



extension String {
    var isValidIdentifier: Bool {
        guard !self.isEmpty else { return false}
        
        //TODO: test for
        
        let firstCharacter = self.first!
        if !firstCharacter.isLetter && firstCharacter != "_" {
            return false
        }
        
     
        let validCharacters = self.allSatisfy
        { $0.isLetter  || $0.isNumber || $0 == "_" }
        
        if !validCharacters {
            return false
        }
        
        return true
        
        
    }
}
