contract TestCrc {
    // Constant evaluated at compile time using the built-in crc32() function.
    // According to documentation, crc32("000DEADBEEF000") is expected to be 1821923098.
    const TEST_CRC: Int = crc32("000DEADBEEF000");

    receive() {
        // Dump the constant; expected output: 1821923098
        dump(self.TEST_CRC);
        cashback(sender());
    }
}
