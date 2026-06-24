contract TestIntegerFormats {
    receive() {
        // Testing different literal representations
        let dec: Int = 1_000;          // decimal with underscore
        let hex: Int = 0xABC;           // hexadecimal
        let oct: Int = 0o777;           // octal
        let bin: Int = 0b101010;        // binary
        dump(dec);
        dump(hex);
        dump(oct);
        dump(bin);
    }
}
