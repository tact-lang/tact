// Comprehensive fuzz-testing cycle on Tact operator precedence and related arithmetic features

// Test: Operator Precedence with arithmetic expressions
fun testPrecedence(): Int {
    // Without extra parentheses: multiplication has higher precedence than subtraction, so 5 * 5 - 2 = 25 - 2 = 23
    let a: Int = 5 * 5 - 2;
    // With parentheses: 5 * (5 - 2) = 5 * 3 = 15
    let b: Int = 5 * (5 - 2);
    return a - b; // Expected: 23 - 15 = 8
}

// Test: Unary minus operator
fun testUnaryMinus(): Int {
    // -(-1) should yield 1
    return -(-1);
}

// Test: Non-null assertion operator (!!) on optionals
fun testNonNull(): Int {
    let x: Int? = 42;
    return x!!; // Should return 42
}

// Test: Bitwise XOR operator
fun testBitwiseXor(): Int {
    // 2 ^ 3 (bitwise XOR) should yield 1
    let a: Int = 2;
    let b: Int = 3;
    return a ^ b; // Expected: 1
}

// Test: Shift operator precedence and correctness
fun testShiftOperators(): Bool {
    // Testing left shift operator: 1 << 5 should yield 32
    return (1 << 5) == 32;
}

// Test: Equality precedence with shift operator
fun testEqualityPrecedence(): Bool {
    // The expression 1 << 5 == 32 should compute as (1 << 5) == 32 due to left shift having higher precedence than equality
    return 1 << 5 == 32;
}

// Test: Logical inversion operator
fun testLogicalNot(): Bool {
    return !false; // Expected: true
}

// Combined report function aggregating results from all tests
fun report(): Int {
    let prec = testPrecedence();         // Expected 8
    let unary = testUnaryMinus();         // Expected 1
    let nonNull = testNonNull();          // Expected 42
    let xor = testBitwiseXor();           // Expected 1
    let shiftCorrect = testShiftOperators() ? 1 : 0;  // Expected 1
    let eqPrec = testEqualityPrecedence() ? 1 : 0;      // Expected 1
    let logical = testLogicalNot() ? 1 : 0;             // Expected 1
    // Total expected: 8 + 1 + 42 + 1 + 1 + 1 + 1 = 55
    return prec + unary + nonNull + xor + shiftCorrect + eqPrec + logical;
}

// Entry point to invoke report() and check the aggregated value
fun main(): Int {
    return report();
}
