contract StringTest {
    fun testEscapeSequences(): String {
        return "This contains a newline\nand a tab:\tTabbed text";
    }

    receive() {
        dump(self.testEscapeSequences());
    }
}