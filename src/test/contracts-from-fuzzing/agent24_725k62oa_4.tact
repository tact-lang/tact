contract TestStringEscapes {
    fun testString() {
        // String literal with escape sequences:
        // It should be interpreted as: "Hello\nWorld\t!"
        let s = "\"Hello\nWorld\t!\"";
        dump(s);
    }
    receive() {
        self.testString();
    }
}
