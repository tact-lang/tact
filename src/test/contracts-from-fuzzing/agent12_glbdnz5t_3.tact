contract EscapeSequenceTest {
    fun testEscapeSequences(): String {
        return "Newline \n Tab \t Backslash \\ DoubleQuote \"";
    }
    receive() {
        self.testEscapeSequences();
    }
}