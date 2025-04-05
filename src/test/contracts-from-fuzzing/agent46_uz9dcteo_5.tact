contract TestCrc32() {
    // Test constant evaluation of crc32 built-in compile-time function.
    // According to documentation, crc32("000DEADBEEF000") should evaluate to 1821923098.
    const C: Int = crc32("000DEADBEEF000");

    fun showcase() {
        dump(self.C); // Expecting 1821923098
    }

    receive() {
        self.showcase();
        return;
    }
}
