contract StringTest {
    fun testStringLiteral(): String {
        return "Hello, World!";
    }
    receive() {
        self.testStringLiteral();
    }
}