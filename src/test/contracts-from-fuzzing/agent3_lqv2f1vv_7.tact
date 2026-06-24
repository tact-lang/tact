fun testTernary(): Int {
    // Correctly nested ternary operator: consequence case is parenthesized
    return false ? (false ? 1 : 2) : 3;
}

contract TesterTernary {
    receive() {
        testTernary();
    }
}
