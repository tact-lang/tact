// Test 1: Basic constant arithmetic
contract ConstArithmetic {
    const A: Int = 10;
    const B: Int = 32;
    // Constant arithmetic: using self.A and self.B
    const C: Int = self.A + self.B; // expected 42
    result: Int = self.C;

    receive() { }
}
