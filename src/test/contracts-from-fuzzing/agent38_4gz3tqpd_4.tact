contract StringTest {
    fun testStringHash(): Int {
        return "Hello, Tact!".hashData();
    }

    receive() {
        dump(self.testStringHash());
    }
}