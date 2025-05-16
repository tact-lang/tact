contract StringExprTest() {
    fun test() {
        // Test string literal with escape sequences and unicode escapes
        let s: String = "Hello \"Tact\" \n Unicode: \u{1F600}";
        dump(s);
    }

    receive() {
        self.test();
    }
}
