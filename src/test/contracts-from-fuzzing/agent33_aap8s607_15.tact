contract TestStringLiterals {
    receive() {
        // Testing escape sequences in string literals
        let s1: String = "Line1\nLine2";      // newline escape
        let s2: String = "Tab:\tEnd";         // tab escape
        let s3: String = "Backslash:\\";       // backslash escape
        let s4: String = "Quote: \"quoted\""; // double quote escape
    }
}
