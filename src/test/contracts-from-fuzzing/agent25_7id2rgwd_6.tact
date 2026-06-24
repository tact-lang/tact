contract TestComptimeFunctions {
    // Constants using compile-time functions
    const TON_VAL: Int = ton("1");         // 1 Toncoin -> 10^9 nanoToncoins
    const ASCII_VAL: Int = ascii("a");       // 'a' -> 97
    const CRC: Int = crc32("test");          // some CRC-32 checksum value

    receive() {
         let combined: Int = self.TON_VAL + self.ASCII_VAL; // Using constants in an expression, expected: 1000000000 + 97
    }
}
