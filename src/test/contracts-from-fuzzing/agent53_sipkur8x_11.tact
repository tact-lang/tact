contract TestBitwiseOps {
    receive() {}

    // Test bitwise AND operator
    fun testAnd(a: Int, b: Int): Int {
        return a & b;
    }

    // Test bitwise OR operator
    fun testOr(a: Int, b: Int): Int {
        return a | b;
    }

    // Test bitwise XOR operator
    fun testXor(a: Int, b: Int): Int {
        return a ^ b;
    }
}
