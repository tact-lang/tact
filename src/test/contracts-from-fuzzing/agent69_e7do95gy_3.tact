contract TestEscapeSequences {
    receive() {
        // Test 2: String escape sequences handling
        let s1: String = "line 1\nline 2";
        let s2: String = "tab\tseparated";
        let s3: String = "quote:\"inside\"";
        let s4: String = "backslash: \\";
    }
}
