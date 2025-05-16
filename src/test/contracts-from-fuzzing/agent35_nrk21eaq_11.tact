// Continuing Fuzz Testing Cycle - Part 2

// Next, let's test the ternary operator. According to the documentation,
// it should evaluate to the first expression if the condition is true, otherwise second.

contract TernaryTest {
    fun testTernary(x: Int): Int {
        // If x is non-zero, return x, else return -1
        return x != 0 ? x : -1;
    }

    receive() {
        self.testTernary(10);
        self.testTernary(0);
    }
}
