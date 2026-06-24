extends fun intToStr(self: Int): String {
    return self.toString();
}

contract ExtensionExprTest {
    fun test() {
        // Testing extension function call on an integer literal
        // Expected output: "42"
        dump(42.intToStr());
    }

    receive() {
        self.test();
    }
}
