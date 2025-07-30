contract TestDivision() {
    fun run() {
        // Testing integer division rounding behavior
        let positiveDivision = 3 / 2; // According to docs, rounds toward -∞, so 3/2 should be 1
        dump(positiveDivision); // Expected output: 1

        let negativeDivision = -3 / 2; // Floor division: -3/2 = -2 in Python (rounds down)
        dump(negativeDivision); // Expected output: -2
    }

    receive() {
        self.run();
    }
}
