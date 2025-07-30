contract Playground {
    receive("plays") {
        // Integer literals: decimal, with underscore, hexadecimal, octal, binary
        dump(42);        // decimal
        dump(1_000);     // decimal with underscore
        dump(0x2A);      // hexadecimal for 42
        dump(0o52);      // octal for 42 (5*8 + 2 = 42)
        dump(0b101010);  // binary for 42
    }
}
