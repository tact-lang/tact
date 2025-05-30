contract TestLiteralBases {
    receive() {
        // Test integer literals in different bases with underscores
        let dec: Int = 42;                   // decimal
        let hex: Int = 0xF;                  // hexadecimal: 15
        let oct: Int = 0o777;                // octal: 511
        let bin: Int = 0b101010;             // binary: 42
        let total: Int = dec + hex + oct + bin; // Expected: 42 + 15 + 511 + 42 = 610
        dump(total);
    }
}
