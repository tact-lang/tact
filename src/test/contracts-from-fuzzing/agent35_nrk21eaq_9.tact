contract LetBlockTest {
    // Test 1: Normal let declaration with initialization using inferred type
    fun testInferred(): Int {
        let x = 100; // inferred as Int
        return x;
    }

    // Test 2: Block scoping test using a block statement (not as an expression)
    fun testBlock(): Int {
        let x: Int = 10;
        {
            let y: Int = x + 10; // y is scoped inside this block
        }
        // x should remain unchanged
        return x;
    }

    // Test 3: Wildcard variable '_' not accessible
    fun testWildcard(): Int {
        let _ = 123;
        // Cannot use '_', so just return a constant
        return 0;
    }

    receive() {
        self.testInferred();
        self.testBlock();
        self.testWildcard();
    }
}
