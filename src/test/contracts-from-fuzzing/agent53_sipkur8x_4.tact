contract Test {
    receive() {}

    // Test: Ternary operator
    fun testTernary(a: Int, b: Int): Int {
        return a > b ? a : b;
    }

    // Test: if/else control flow
    fun testIfElse(x: Int): Int {
        if (x == 0) {
            return 10;
        } else if (x < 0) {
            return -1;
        } else {
            return 20;
        }
    }

    // Test: operator precedence
    fun testPrecedence(): Int {
        return 2 + 3 * 4; // Expected 14, not 20
    }

    // Test: try-catch simple case
    fun testTryCatch(): Int {
        try {
            throw(101);
        } catch(err) {
            return err; // Expected to catch 101
        }
    }

    // Test: shift operator
    fun testShift(a: Int): Int {
        return a << 1;
    }

    // Test: local variable shadowing state field
    v: Int = 5;
    fun testShadow(): Int {
        let v = 10;
        return v + self.v; // Expected 15
    }
}
