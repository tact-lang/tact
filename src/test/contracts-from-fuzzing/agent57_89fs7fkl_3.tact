contract TestConstEval {
    // Contract-level constants computed at compile-time using built-in functions
    const T_Ton: Int = ton("1");            // 1 Toncoin = 1e9 nanoToncoin
    const T_Ascii: Int = ascii("⚡");        // Expected to be 14850721
    const T_CRC: Int = crc32("000DEADBEEF000"); // Expected to be 1821923098

    receive() {
        // Use self to refer to contract-level constants
        require(self.T_Ton == 1000000000, "ton evaluation incorrect");
        require(self.T_Ascii == 14850721, "ascii evaluation incorrect");
        require(self.T_CRC == 1821923098, "crc32 evaluation incorrect");
    }
}
