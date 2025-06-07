contract StringTest {
    fun testEscapeSequences(): String {
        return "Line 1\nLine 2\tTabbed";
    }
    receive() {
        self.testEscapeSequences();
    }
}