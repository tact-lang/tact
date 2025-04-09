contract TestCrc32() {
    // Constant computed at compile time using the built-in crc32 function
    // Expected value: 1821923098, as per documentation
    const CR: Int = crc32("000DEADBEEF000");

    fun runTest() {
        // Dump the constant value; accessed from contract-level constant
        dump(self.CR);
    }

    receive() {
        self.runTest();
    }
}
