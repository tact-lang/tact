contract Test {
    // Constants evaluated at compile-time
    const A: Int = ascii("⚡");           // expected value: 14850721
    const T: Int = ton("1");              // expected value: 1000000000
    const B: Int = 1730 + (8 | 8);          // expected value: 1738

    // Function to retrieve the constant sum using contract-level constants
    fun getSum(): Int {
        // Expected: 14850721 + 1000000000 + 1738 = 1014852459
        return self.A + self.T + self.B;
    }

    // Receiver function to trigger getSum() and dump the sum
    receive() {
        dump(self.getSum());
    }
}
