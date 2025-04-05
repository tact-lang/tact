contract TestCrc32() {
    // Evaluate crc32 constant: expecting 1821923098
    const CRC: Int = crc32("000DEADBEEF000");

    receive() {
        dump(self.CRC.toString());
    }
}
