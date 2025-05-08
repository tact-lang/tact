// Test Case 1: Compile-time arithmetic evaluation using a constant
contract TestArithmetic {
    // Constant expression: (10 * 2) - (5 + 5) should be computed at compile time
    const CALC: Int = (10 * 2) - (5 + 5);
    
    receive() {
        // Use constant in a simple assignment
        let a: Int = self.CALC; // Expected value: 10
    }
}
