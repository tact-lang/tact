contract TestIntLiterals() {
    fun test() {
        // Testing integer literal expressions
        // Decimal: 42, Binary: 0b101010, Octal: 0o52, Hex: 0x2A should all be equal
        let a: Int = 42;
        let b: Int = 0b101010;
        let c: Int = 0o52;
        let d: Int = 0x2A;

        // If all equal, dump 1, else dump 0
        dump((a == b && b == c && c == d) ? 1 : 0);
    }

    receive() {
        self.test();
        cashback(sender());
    }
}
