contract LiteralExprTest() {
    fun test() {
        // Testing various literal expressions
        // Integer literals in different bases and formats:
        dump(0);          // Expected output: 0 (decimal 0)
        dump(42);         // Expected output: 42 (decimal 42)
        dump(1_000);      // Expected output: 1000 (underscores allowed in numeric literals)
        dump(020);        // As per docs, this is decimal, not octal, Expected: 20
        dump(0xABC);      // Expected output: 2748 (hexadecimal)
        dump(0o777);      // Expected output: 511 (octal)
        dump(0b1010);     // Expected output: 10 (binary)

        // Boolean literals
        dump(true);       // Expected output: true
        dump(false);      // Expected output: false

        // Null literal
        dump(null);       // Expected output: null
    }

    receive() {
        self.test();
    }
}
