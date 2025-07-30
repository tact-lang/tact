contract TestLiterals {
    fun showcase() {
        // Integer literals in various bases:
        dump(0);            // decimal literal
        dump(42);           // decimal literal
        dump(1_000);        // underscore in numeric literal
        dump(0xABC);        // hexadecimal literal
        dump(0o777);        // octal literal
        dump(0b1010);       // binary literal

        // Boolean literals:
        dump(true);
        dump(false);

        // String literals with escape sequences:
        dump("Hello, World!");
        dump("Line break:\nTab:\tCarriage Return:\r");

        // null literal
        dump(null);
    }

    receive() {
        self.showcase();
    }
}
