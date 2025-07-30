contract AsciiTest {
    // Test ascii function on ASCII and Unicode characters
    a: Int = ascii("a");           // Expected: 97 (0x61)
    b: Int = ascii("⚡");         // Expected: 14850721 (0xE29AA1) from docs

    receive() {
        dump(self.a);
        dump(self.b);
    }
}
