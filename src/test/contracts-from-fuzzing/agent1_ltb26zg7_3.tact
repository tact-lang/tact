contract TestConsts() {
    // Define compile-time constants using built-in functions
    const TON_VALUE: Int = ton("1");          // expected to be 1000000000
    const ASCII_VALUE: Int = ascii("⚡");       // expected to be 14850721
    const CRC_VALUE: Int = crc32("deadbeef");    // expected to be a 32-bit value

    fun run() {
        dump(self.TON_VALUE.toString());
        dump(self.ASCII_VALUE.toString());
        dump(self.CRC_VALUE.toString());
    }

    receive() {
        self.run();
    }
}
