contract TestTernary() {
    fun run() {
        // Ternary operator (?:) tests
        // According to documentation, ?: is right-associative
        // Expression 1: false ? 1 : (false ? 2 : 3) should yield 3
        let result1 = false ? 1 : (false ? 2 : 3);
        dump(result1); // Expected output: 3

        // Expression 2: false ? 1 : true ? 2 : 3 should yield 2
        let result2 = false ? 1 : true ? 2 : 3;
        dump(result2); // Expected output: 2
    }

    receive() {
        self.run();
    }
}
