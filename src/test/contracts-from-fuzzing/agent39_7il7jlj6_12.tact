fun testHashData(): Int {
    // This should compute the SHA-256 based hash of the string data (up to 127 bytes).
    return "Never gonna give you up!".hashData();
}

contract Test {
    receive() {
        let h: Int = testHashData();
    }
}
