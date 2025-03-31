fun testInvalidBase64Char(): Slice {
    let s: String = "???";
    return s.fromBase64();
}

contract TestBase64Error {
    receive() {
        testInvalidBase64Char();
    }
}
