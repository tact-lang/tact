contract TestCrc32 {
    // Test constant evaluation of the built-in function crc32.
    // According to documentation, crc32("000DEADBEEF000") should compute to 1821923098.
    const CRC: Int = crc32("000DEADBEEF000");

    receive() {
        let result = self.CRC;
        dump(result);
    }
}
