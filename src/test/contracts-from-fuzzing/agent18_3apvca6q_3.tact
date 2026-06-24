contract TestLiteralExpressions {
    receive() {
        // Test integer literals in various bases
        dump(123);     // decimal literal
        dump(0xA0);    // hexadecimal literal
        dump(0o77);    // octal literal
        dump(0b1010);  // binary literal

        // Test boolean and string literals
        dump(true);           // boolean literal
        dump(false);          // boolean literal
        dump("Tact language"); // string literal
    }
}
