contract TestTernary {
    // This function tests the ternary operator expression
    fun test_ternary(): Int {
         // Ternary operator: if condition is true, returns the first operand; if false, returns the second.
         // Expected: true ? 7 : 3 -> 7
         return true ? 7 : 3;
    }

    receive() {
         dump(self.test_ternary());
    }
}
