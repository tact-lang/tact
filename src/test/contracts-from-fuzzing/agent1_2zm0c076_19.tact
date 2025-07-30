contract TestLiteralsExtra {
    receive() {
        // Hexadecimal literal
        let hexVal: Int = 0xFF; // 255
        // Binary literal with underscores
        let binVal: Int = 0b1010_1010; // 170
        // Literal with underscores in decimal
        let decVal: Int = 1_000_000; // 1000000
        // Combined expression
        let combined: Int = hexVal + binVal + decVal; // 255 + 170 + 1000000 = 1000425
    }
}
