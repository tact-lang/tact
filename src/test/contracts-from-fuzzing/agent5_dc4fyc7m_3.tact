contract StringTest {
    fun testEscapeSequences(): String {
        return "Line 1\nLine 2\tTabbed";
    }
    receive() {
        let result: String = self.testEscapeSequences();
        dump(result);
    }
}