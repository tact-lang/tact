contract TestLiterals {
    fun test() {
        // Testing various literal expressions as per "Expressions" section

        // Integer literals: decimal, hexadecimal, octal, and binary
        dump(0);          // Expected: 0
        dump(42);         // Expected: 42
        dump(0xABC);      // Expected: 2748 (hex conversion)
        dump(0o777);      // Expected: 511 (octal)
        dump(0b1111);     // Expected: 15 (binary)

        // Boolean literals
        dump(true);       // Expected: true
        dump(false);      // Expected: false

        // String literals with typical contents
        dump("Hello, world!");
        dump("Line1\nLine2\tTabbed");

        // null literal
        dump(null);

        // self literal and a constant expression reference:
        dump(self.MY_CONST); // Expect contract constant
    }

    const MY_CONST: Int = 1234;

    receive() {
        self.test();
    }
}
