// Test Case 1: Primitive Int Division Rounding
// According to documentation, the division of integers rounds toward -∞.
// Thus, 3 / 2 should produce 1.

contract TestIntDivision {
    // The receiver function is used to trigger execution during testing.
    receive() {
        let a: Int = 3 / 2; // Expected to be 1
        dump(a);
        // Use cashback to complete the message processing.
        cashback(sender());
    }
}
