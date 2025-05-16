contract TestOtherLiterals {
    receive() {
        // Test various forms of integer literals: hexadecimal, octal, binary, and decimals with underscores
        dump(0xF);      // hexadecimal, expected 15
        dump(0o777);    // octal, expected 511
        dump(0b1010);   // binary, expected 10
        dump(1_000);    // decimal with underscores, expected 1000
        dump(020);      // leading 0, still decimal in Tact, expected 20
    }
}
