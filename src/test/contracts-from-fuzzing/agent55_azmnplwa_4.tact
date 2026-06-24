contract Test {
    receive() {
        // Test newline escape sequence
        let s1: String = "Line1\nLine2"; 
        
        // Test double quote escape sequence
        let s2: String = "Quote: \"Test\"";

        // Test backslash escape sequence
        let s3: String = "Backslash: \\\";";
    }
}
