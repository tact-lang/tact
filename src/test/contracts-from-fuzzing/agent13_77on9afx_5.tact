contract TestCRC32() {
    // Testing compile-time evaluation of crc32() built-in function
    // According to documentation, crc32("000DEADBEEF000") should produce 1821923098
    const TEST_CRC32: Int = crc32("000DEADBEEF000");

    fun runTest() {
        dump(self.TEST_CRC32 == 1821923098);
    }

    receive() {
        self.runTest();
        cashback(sender());
    }
}
