fun testUnary(): Int {
    // Testing the unary negate operator
    let a: Int = -(-1); // according to docs, should be 1
    let b: Int = --1;   // should also yield 1, as per documentation example
    
    // Testing the unary non-null assertion operator (!!)
    let optionalValue: Int? = 42;
    let nonNull: Int = optionalValue!!; // should succeed and be 42

    // Testing the unary inverse operator '!' on booleans
    let boolTrue: Bool = true;
    let inverted: Bool = !boolTrue; // should be false

    // Combine results in a simple arithmetic check: return  a + b + nonNull + (inverted ? 0 : 1)
    // Expect: 1 + 1 + 42 + 1 = 45 
    return a + b + nonNull + (inverted ? 0 : 1);
}

fun testBitwiseShifts(): Int {
    // Testing bitwise shift right and shift left operators
    // For example, 4 >> 1 should be 2, and 2 << 3 should be 16
    let right: Int = 4 >> 1; // 2
    let left: Int = 2 << 3;  // 16
    
    // Testing negative numbers with right shift: -6 >> 1; arithmetic shift should keep sign
    let negativeShift: Int = -6 >> 1; // expected -3
    
    // Combine them
    return right + left + negativeShift; // 2 + 16 - 3 = 15
}

fun main() : Int {
    // Run the tests: testUnary and testBitwiseShifts
    let res1: Int = testUnary();
    let res2: Int = testBitwiseShifts();
    // Use arithmetic to differentiate the two test results
    return res1 + res2; // expected 45 + 15 = 60
}
