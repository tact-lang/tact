contract TestNumericLiterals {
    receive() {
        // Testing various numeric literal notations
        let dec: Int = 42;
        let hex: Int = 0x2A;
        let oct: Int = 0o52;
        let bin: Int = 0b101010;
        dump(dec);
        dump(hex);
        dump(oct);
        dump(bin);
    }
}
