contract TestStringLiteral() {
    fun test() {
        // Testing string literal expressions including escape sequences
        // Expected to dump the string: Test\nNewLine\tTabbed😀
        // where \n, \t, and unicode escape \u{1F600} are interpreted correctly.
        dump("Test\nNewLine\tTabbed\u{1F600}");
    }

    receive() {
        self.test();
        cashback(sender());
    }
}
