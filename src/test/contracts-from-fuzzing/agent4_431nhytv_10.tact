// Test 2: Constant arithmetic evaluation inside a contract
contract Test {
    // Constant arithmetic evaluated at compile-time
    const ADD: Int = 5 + 7;  // Expected to evaluate to 12

    // Use constant in persistent state field
    x: Int = self.ADD;

    receive() {
        // No operation
    }
}
