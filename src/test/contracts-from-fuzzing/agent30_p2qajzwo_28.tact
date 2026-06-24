contract TestLiteralIntegerFormats {
    receive() {
        // Testing various integer literal notations: hexadecimal, octal, binary and decimal
        // 0xF (hexadecimal) = 15, 0o7 (octal) = 7, 0b1010 (binary) = 10, and 10 (decimal) = 10
        let a: Int = 0xF + 0o7 + 0b1010 + 10; // Expected result: 15 + 7 + 10 + 10 = 42
        a;
    }
}
