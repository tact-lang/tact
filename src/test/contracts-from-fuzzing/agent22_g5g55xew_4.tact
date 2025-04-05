contract TestCrc32() {
    // Test compile-time evaluation of the crc32() built-in function
    // Expected: crc32("000DEADBEEF000") evaluates to 1821923098
    const C: Int = crc32("000DEADBEEF000");

    receive() {
        dump(self.C);
    }
}
