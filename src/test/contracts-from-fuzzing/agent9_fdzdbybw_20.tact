contract TestLeadingZero {
    fun test() {
        // According to the documentation, integer literals with a leading zero in Tact are treated as decimal, not octal.
        // Therefore, 020 should be interpreted as 20 (decimal) not as an octal literal.
        let a = 020; // Expected to be 20 in decimal
        dump(a);    // Should output 20
    }

    receive() {
        self.test();
    }
}
