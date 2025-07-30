fun testUnaryNegate(): Int {
    return -(-5); // Expect 5
}

fun testBitwiseNot(): Int {
    return ~5;    // Bitwise NOT of 5
}

fun testLogicalNot(): Bool {
    return !true; // Expect false
}

contract UnaryOperatorsTest {
    receive() {
        let a: Int = testUnaryNegate();
        let b: Int = testBitwiseNot();
        let c: Bool = testLogicalNot();
        // Execute functions to test cardinal unary operations
    }
}
