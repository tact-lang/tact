contract TestStringLiteral {
    receive() {
        // Testing various escape sequences in string literals
        let s1: String = "hello \n world";      // newline escape
        let s2: String = "quote: \" " ;         // double quote escape
        let s3: String = "backslash: \\ " ;       // backslash escape
        let s4: String = "tab\tseparated";         // tab escape
    }
}
