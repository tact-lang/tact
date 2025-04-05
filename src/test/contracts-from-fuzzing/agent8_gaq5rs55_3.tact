contract ExprTestString {
    fun test() {
        // Test string literal with escape sequences: it should preserve backslash and quote characters, and newlines and tabs
        let s: String = "\\\"\n\t"; // expected literal: \" followed by newline and tab
        dump(s);
    }
    
    receive() {
        self.test();
    }
}
