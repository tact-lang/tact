contract TestConstArithmetic {
    // Test arithmetic operations and constant evaluation
    const A: Int = 5;
    const B: Int = 10;
    const SUM: Int = self.A + self.B;
    const NEG: Int = -self.A;

    receive() {
        let x: Int = self.SUM * self.NEG; // (5+10)*(-5) = 15 * (-5) = -75
    }
}
