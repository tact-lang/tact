contract TestCompileTimeFunctions {
    fun test() {
        // Testing compile-time function ascii, which should convert the input string to its integer representation.
        // According to documentation, ascii("⚡") should yield 14850721 (or 0xE29AA1).
        let a = ascii("⚡");
        dump(a);
    }
    
    receive() {
        self.test();
    }
}
