contract OperatorConst() {
    // Test a constant expression with arithmetic and bitwise operators
    // Expression: 1 + 2 * 3 + (4 | 8)
    // Expected calculation: 2*3 = 6, (4 | 8) = 12, so result = 1 + 6 + 12 = 19
    const CALC: Int = 1 + 2 * 3 + (4 | 8);

    get fun get() : Int {
        require(self.CALC == 19, "Operator evaluation failed: expected 19");
        return self.CALC;
    }

    receive() {
        // Do nothing for testing
    }
}
