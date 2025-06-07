fun testUnicode(): String {
    return "some unicode: \uFFFF ";
}

contract TestUnicode {
    receive() {
        testUnicode();
    }
}
