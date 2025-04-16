contract TestIntLiteralFormats {
    receive() {
        let a: Int = 1_000;    // decimal with underscore
        let b: Int = 020;      // decimal literal with leading zero
        let c: Int = 0xAB;     // hexadecimal literal
        let d: Int = 0o77;     // octal literal
        let e: Int = 0b1010;   // binary literal
    }
}
