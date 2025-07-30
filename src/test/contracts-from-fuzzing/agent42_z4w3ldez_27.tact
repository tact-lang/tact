struct DivResult {
    a: Int;
    b: Int;
}

contract DivTest {
    fun testDiv(): DivResult {
        return DivResult { a: 3 / 2, b: -3 / 2 };
    }

    receive() {
        // Expected: 3/2 = 1 (since 3/2 floors to 1) and -3/2 = -2 (rounding toward -∞)
        dump(self.testDiv().a);
        dump(self.testDiv().b);
        cashback(sender());
    }
}
