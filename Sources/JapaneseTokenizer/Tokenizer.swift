//
//  Tokenizer.swift
//  JapaneseTokenizer
//
//  Created by Tibor Felföldy on 2025-09-07.
//

import Mecab_Swift
import IPADic

public struct Token: Sendable {
    public let text: String
    public let reading: String
    public let dictionaryForm: String
    public let range: Range<String.Index>

    /// Identifier based on `pos-id.def` file.
    public let posId: UInt16
}

public actor Tokenizer {
    let base: Mecab_Swift.Tokenizer
    
    public init() throws {
        base = try Mecab_Swift.Tokenizer(dictionary: IPADic())
    }
    
    public func tokenize(_ text: String) -> [Token] {
        let annotations = base.tokenize(text: text)
        
        return annotations.map { annotation in
            Token(
                text: annotation.base,
                reading: annotation.reading,
                dictionaryForm: annotation.dictionaryForm,
                range: annotation.range,
                posId: annotation.posID,
            )
        }
    }
}
