contract Test {
    receive() {
        dump(42);         // decimal literal
        dump(0x1F);       // hexadecimal literal
        dump(0o11);       // octal literal
        dump(0b1010);     // binary literal
        dump(true);       // boolean literal
        dump("Tact");   // string literal
        dump(null);       // null literal
    }
}
