contract TestLiteralIntegers {
    receive() {
        // Decimal literal
        let dec: Int = 123;
        // Hexadecimal literal
        let hex: Int = 0xABC;
        // Octal literal (note: leading 0 does not denote octal unless using 0o prefix, so this is decimal)
        let oct: Int = 020;
        // Binary literal
        let bin: Int = 0b1010;
    }
}
