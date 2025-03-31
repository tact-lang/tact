fun testPrecedence(): Int {
    // Without extra parentheses: multiplication has higher precedence than subtraction, so 5*5 - 2 = 25 - 2 = 23
    let a: Int = 5 * 5 - 2;
    // With parentheses: 5 * (5 - 2) = 5 * 3 = 15
    let b: Int = 5 * (5 - 2);
    return a - b; // Expected: 23 - 15 = 8
}

fun testUnaryMinus(): Int {
    // Unary minus operator applied twice: -(-1) should yield 1
    return -(-1);
}

fun testNonNull(): Int {
    // Testing non-null assertion operator !! on an optional Int
    let x: Int? = 42;
    // x!! returns the non-null value; if x were null it would trigger runtime error
    return x!!;
}

fun testBitwiseXor(): Int {
    // Testing bitwise XOR operator: 2 ^ 3 should yield 1
    let a: Int = 2;
    let b: Int = 3;
    return a ^ b; // Expected: 1
}

fun testShiftOperators(): Bool {
    // Testing left shift operator: 1 << 5 should yield 32
    return (1 << 5) == 32;
}

fun testEqualityPrecedence(): Bool {
    // The shift operator << has higher precedence than ==, so 1 << 5 == 32 computes as (1 << 5) == 32.
    return 1 << 5 == 32;
}

fun testLogicalNot(): Bool {
    // Testing the logical inversion operator: ! applied to false should yield true
    return !false;
}

fun report(): Int {
    // Combine result values from other tests
    let prec = testPrecedence(); // Expected 8
    let unary = testUnaryMinus(); // Expected 1
    let nonNull = testNonNull(); // Expected 42
    let xor = testBitwiseXor(); // Expected 1
    let shiftCorrect = testShiftOperators() ? 1 : 0;
    let eqPrec = testEqualityPrecedence() ? 1 : 0;
    let logical = testLogicalNot() ? 1 : 0;
    return prec + unary + nonNull + xor + shiftCorrect + eqPrec + logical; // 8 + 1 + 42 + 1 + 1 + 1 + 1 = 55
}
