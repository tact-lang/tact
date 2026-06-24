contract TestStringExpr() {
    fun test() {
        // Testing string literal expressions and method call asComment()
        let s: String = "Hello, Tact! \"Test\" \n new line";
        dump(s);          // expected output: Hello, Tact! "Test" \n new line (as string representation)
        dump(s.asComment()); // expected: cell representation of the string with comment prefix
    }
    receive() {
        self.test();
    }
}
