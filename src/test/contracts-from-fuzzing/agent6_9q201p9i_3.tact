contract TestCrc32() {
    // Constant evaluated at compile-time using the crc32 built-in function
    // According to the documentation, crc32("000DEADBEEF000") should produce 1821923098
    const crc_val: Int = crc32("000DEADBEEF000");

    receive() {
        // Access the constant via self
        dump(self.crc_val);
        cashback(sender());
    }
}
