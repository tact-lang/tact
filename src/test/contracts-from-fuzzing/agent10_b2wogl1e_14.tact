contract TestLeadingZeroLiteral() {
    fun run() {
        // According to the documentation, a literal like 020 is interpreted as a decimal literal (base 10), not as an octal value.
        let lit = 020;
        require(lit == 20, "Expected 020 to be interpreted as 20");
    }

    receive() {
        self.run();
    }
}
