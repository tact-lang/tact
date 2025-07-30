contract TestCrc32 {
    // Contract-level constant evaluating the crc32 built-in compile-time function.
    // According to documentation, crc32("000DEADBEEF000") should be 1821923098.
    const CRC: Int = crc32("000DEADBEEF000");
    
    receive() {
        require(self.CRC == 1821923098, "Incorrect crc32 constant evaluation");
        cashback(sender());
    }
}
