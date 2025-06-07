contract TestIntLiterals {
    // Testing various integer literal forms
    // Decimal literal
    receive() {
        let a: Int = 42;
        // Hexadecimal literal (should be equivalent to 42)
        let b: Int = 0x2A;
        // Octal literal (note: 0o52 is octal for 42)
        let c: Int = 0o52;
        // Binary literal (binary for 42: 101010)
        let d: Int = 0b101010;
    }
}
