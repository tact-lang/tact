contract TestHexLiterals {
    receive() {
        // Hexadecimal literals: 0xA = 10, 0x5 = 5
        let a: Int = 0xA + 0x5;
        dump(a); // expected 15
    }
}