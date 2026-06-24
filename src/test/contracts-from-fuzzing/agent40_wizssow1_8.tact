contract TestCRC32() {
    // Testing compile-time evaluation of crc32() with a specific string
    // Expected value: 1821923098
    const VAL: Int = crc32("000DEADBEEF000");

    get fun getVAL(): Int {
        return self.VAL;
    }

    // Dummy receive function to ensure full compilation
    receive() {
        cashback(sender());
    }
}
