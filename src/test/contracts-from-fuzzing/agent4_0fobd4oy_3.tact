contract TernaryTest {
    fun testTernary() {
        // Ternary operator associativity: right-associative
        let res1: Int = false ? 1 : (false ? 2 : 3); // Expected: 3
        let res2: Int = false ? 1 : true ? 2 : 3;    // Expected: 2, because it associates as: false ? 1 : (true ? 2 : 3)
        dump(res1);
        dump(res2);
    }

    receive() {
        self.testTernary();
    }
}
