contract TestStringLiteral {
    receive() {
        let s1: String = "Hello \"Tact\" World";  // test escaped quotes
        let s2: String = "Newline\nTest";             // test newline escape
        let s3: String = "Tab\tSeparated";             // test tab escape
    }
}
