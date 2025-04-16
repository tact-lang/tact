contract TestLiterals {
    receive() {
        // Integer literals
        dump(42);       // decimal literal
        dump(0xFF);     // hexadecimal literal
        dump(0o77);     // octal literal
        dump(0b1010);   // binary literal

        // Boolean literals
        dump(true);
        dump(false);

        // String literals with escape sequences
        dump("Hello, World!");
        dump("Line1\nLine2");
        dump("Quote: \"inside\"");
    }
}
