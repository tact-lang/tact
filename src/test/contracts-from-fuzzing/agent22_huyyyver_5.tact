contract TestStringLiterals {
    fun getStr(): String {
        // Test string literal with escape sequences and Unicode
        // Expected to correctly interpret escape sequences and Unicode
        let s: String = "Hello, \n World! \u{1F601}";
        return s;
    }

    receive() {
        // Force evaluation by invoking the function
        let str = self.getStr();
        str; // Expression result
    }
}
