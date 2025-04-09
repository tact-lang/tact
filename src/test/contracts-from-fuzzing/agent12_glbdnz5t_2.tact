contract StringTest {
    fun testStringLiterals(): String {
        return "Hello, Tact!";
    }
    receive() {
        self.testStringLiterals();
    }
}