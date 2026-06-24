contract TestIntegerLiterals {
    receive() {
        let dec: Int = 1_000;          // decimal with underscore
        let hex: Int = 0xABC;           // hexadecimal literal
        let oct: Int = 0o777;           // octal literal
        let bin: Int = 0b1010;          // binary literal
        dump(dec);
        dump(hex);
        dump(oct);
        dump(bin);
    }
}
