contract TestStringEscape {
    fun testEscape() {
        // Testing string literals with escape sequences
        // Expected string: a newline, a tab, a null char, 'A', and 'B'
        let s: String = "\n\t\x00\x41\u0042";
        dump(s);
    }
    
    receive() {
        self.testEscape();
    }
}
