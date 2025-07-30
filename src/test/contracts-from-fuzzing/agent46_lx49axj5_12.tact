contract TestMultilineEquality {
    receive() {
        // Define a string using explicit escape sequence for newline
        let s: String = "Hello\nWorld";
        
        // Define a string using a literal newline in the source code
        let t: String = "Hello
World";
        
        // Compare the two strings
        if (s == t) {
            // Dump 1 if they are equal
            dump(1);
        } else {
            // Dump 0 if they are not equal
            dump(0);
        }
    }
}
