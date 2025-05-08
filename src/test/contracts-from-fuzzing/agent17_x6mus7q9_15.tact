contract TestAscii {
    fun run() {
        // Test ascii() conversion on a Unicode character (⚡), expected: 14850721 or 0xE29AA1
        let code: Int = ascii("⚡");
        dump(code);
    }
    receive() {
        self.run();
    }
}
