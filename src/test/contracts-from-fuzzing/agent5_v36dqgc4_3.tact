contract TestCrc {
    // Testing built-in compile-time function: crc32
    const CRC_TEST: Int = crc32("000DEADBEEF000"); // Expected: 1821923098

    receive() {
        require(self.CRC_TEST == 1821923098, "crc32 function evaluation mismatch");
        cashback(sender());
    }
}
