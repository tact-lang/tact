contract TestConstants {
    // Constant evaluation of built-in compile-time functions
    // ton("1") should equal 1000000000, which is 1 Toncoin in nanoToncoins
    const TON_VALUE: Int = ton("1");
    const EXPECTED_TON: Int = 1000000000;

    // ascii("⚡") should evaluate to 14850721 (as per documentation example)
    const LIGHTNING: Int = ascii("⚡");
    const EXPECTED_LIGHTNING: Int = 14850721;

    // crc32("000DEADBEEF000") should evaluate to 1821923098
    const CRC_VALUE: Int = crc32("000DEADBEEF000");
    const EXPECTED_CRC: Int = 1821923098;

    // A receiver to force compilation and to dump a combination of constants
    receive() {
        // Force evaluation by summing the constants using self. prefix for contract-level constants
        let sum = self.TON_VALUE + self.LIGHTNING + self.CRC_VALUE;
        dump(sum);

        // Also, do a trivial check by adding expected constants (must be accessed via self.)
        let expectedSum = self.EXPECTED_TON + self.EXPECTED_LIGHTNING + self.EXPECTED_CRC;
        dump(expectedSum);
    }
}
