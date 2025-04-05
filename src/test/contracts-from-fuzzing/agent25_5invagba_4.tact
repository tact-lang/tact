contract TestString {
    receive() {
        // Test string literals with escape sequences
        let s1: String = "Hello, \nWorld!";
        let s2: String = "Quote: \"test\"";
        dump(s1);
        dump(s2);
    }
}
