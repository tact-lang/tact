contract TestConstEval {
    // Constant evaluated fully at compile time
    const CALC: Int = (5 + 6 * 2) - 1; // Expected: (5 + 12) - 1 = 16

    receive() {
         let multiplied: Int = self.CALC * 3; // Expected: 16 * 3 = 48
    }
}
