fun testEscapes(): String {
    return "hello\nworld\r!\tTest\vBack\bF\f\x41 \u263A \u{1F602}";
}

contract TestContract {
    receive() {
        let s: String = testEscapes();
    }
}
