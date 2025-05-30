contract TestLiterals {
    receive() {
        // Testing various literal expressions
        dump("Tact is awesome!".asComment());  // string literal with asComment extension
        dump(1_000);                              // integer literal with underscore
        dump(0xF);                                // hexadecimal literal
        dump(0b1010);                             // binary literal
    }
}
