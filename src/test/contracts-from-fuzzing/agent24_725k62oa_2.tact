contract Test {
    fun testTernary() {
        // Ternary operator with explicit grouping. According to docs:
        // false ? 1 : (false ? 2 : 3) should evaluate to 3
        let a = false ? 1 : (false ? 2 : 3);
        dump(a);
    }
    receive() {
        self.testTernary();
    }
}
