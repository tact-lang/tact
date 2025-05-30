contract TestCRC() {
    // Define a constant using the compile-time built-in function crc32
    // According to documentation, crc32("000DEADBEEF000") should evaluate to 1821923098.
    const CRC_VAL: Int = crc32("000DEADBEEF000");

    fun test() {
        // Expected output: 1821923098
        dump(self.CRC_VAL);
    }

    receive() {
        self.test();
        cashback(sender());
    }
}
