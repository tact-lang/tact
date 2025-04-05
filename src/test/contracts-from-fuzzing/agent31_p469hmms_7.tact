contract TestLiteralsFormats {
    receive("plays") {
        // Integer literals in different bases and with underscores
        dump(42);           // decimal
        dump(1_000);        // decimal with underscore
        dump(0xA);          // hexadecimal
        dump(0o7);          // octal
        dump(0b1010);       // binary
        // String literal with escape sequences
        dump("Line 1\nLine 2");
    }
}
