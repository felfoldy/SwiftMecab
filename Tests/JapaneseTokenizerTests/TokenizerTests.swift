//
//  TokenizerTests.swift
//  Mecab-Swift
//
//  Created by Tibor Felföldy on 2025-09-07.
//

import Testing
import JapaneseTokenizer

struct JapaneseTokenizerTests {
    @Test func example() async throws {
        let tokenizer = try Tokenizer()
        let tokens = await tokenizer.tokenize("これはペンです。")
        
        #expect(tokens[0].text == "これ")
    }
}
