contract TestCRC32 {
    // Constant evaluation of built-in compile-time function crc32: expecting 1821923098
    const CRC: Int = crc32("000DEADBEEF000");

    receive() {
        require(self.CRC == 1821923098, "crc32 conversion failed");
        dump(self.CRC);
    }
}
