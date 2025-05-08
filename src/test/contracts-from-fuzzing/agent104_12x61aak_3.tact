fun testStringEscapes(): String {
    return "Hello\nworld \"test\"";
}

contract TestContract {
    receive() {
        let s: String = testStringEscapes();
    }
}
