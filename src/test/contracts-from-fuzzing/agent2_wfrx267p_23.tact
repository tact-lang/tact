contract Test {
    receive() {
        // Test literal escape characters in a string.
        // We want the resulting string to contain the following characters:
        //   L i t e r a l   e s c a p e s :   \ n ,   \ t ,   \ x41 ,   \ u0041 ,   \ u{41}
        // That is, the string literally has backslash followed by n, etc.
        
        // To achieve that, we need to double-escape each backslash in the source.
        // The source literal below produces a string whose content is:
        // "Literal escapes: \n, \t, \x41, \u0041, \u{41}"
        let s: String = "Literal escapes: \\n, \\t, \\x41, \\u0041, \\u{41}";
        
        // Define the expected value as the same literal.
        let expected: String = "Literal escapes: \\n, \\t, \\x41, \\u0041, \\u{41}";
        
        // Compare the two strings. If they differ, trigger a dummy computation.
        if (s != expected) {
            let dummy: Int = s.hashData() + expected.hashData();
        }
    }
}
