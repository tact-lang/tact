contract StringTest {
    fun testEmptyString(): String {
        return "";
    }
    receive() {
        self.testEmptyString();
    }
}