contract TestCrc32 {
    // Test compile-time evaluation of crc32() built-in function
    // Expected: 1821923098 as per documentation example
    const CRC: Int = crc32("000DEADBEEF000");

    receive() {
        require(self.CRC == 1821923098, "crc32 constant evaluation failed");
        cashback(sender());
    }
}
