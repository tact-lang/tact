contract TestExpressions {
    // A contract-level constant to test self field access
    const CONST_TEST: Int = 42;

    fun run() {
        // Integer literals
        dump(0);            // decimal literal 0
        dump(42);           // decimal literal 42
        dump(1_000);        // underscore in integer literal
        dump(020);          // octal style numeric literal (interpreted as decimal 20)
        dump(0xABC);        // hexadecimal literal
        dump(0b1010);       // binary literal, expected 10

        // Boolean literals
        dump(true);
        dump(false);

        // String literal with escape sequences
        let s: String = "Hello, Tact!\nNewline Test\tTabbed";
        dump(s);

        // null literal
        dump(null);

        // Self and field access: accessing the contract-level constant
        dump(self.CONST_TEST);

        // Identifier (variable) usage
        let myVar = 123;
        dump(myVar);

        // Global function call: now() (returns UNIX timestamp in seconds)
        dump(now());
    }

    receive() {
         self.run();
    }
}
