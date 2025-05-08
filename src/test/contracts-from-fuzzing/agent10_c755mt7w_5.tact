contract StringTest {
    fun testUnicodeString(): String {
        return "Emoji: \u{1F602}";
    }
    receive() {
        self.testUnicodeString();
    }
}