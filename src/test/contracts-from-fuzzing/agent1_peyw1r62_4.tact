fun testPrecedence(): Int {
    // Testing operator precedence: multiplication has higher precedence than subtraction.
    // Calculation: 5 * 5 - 2 equals (5 * 5) - 2 = 25 - 2 = 23, and 5 * (5 - 2) equals 5 * 3 = 15.
    let a: Int = 5 * 5 - 2;   // expected 23
    let b: Int = 5 * (5 - 2); // expected 15
    return a - b; // expected: 23 - 15 = 8
}

// Additional tests for division and modulo relation:
fun testDivMod(a: Int, b: Int) : Int {
    // Should hold: a == ((a / b) * b + a % b)
    return a - (((a / b) * b) + a % b);
}

fun testDivModCases(): Int {
    // Test various cases for positive and negative dividends and divisors
    let case1: Int = testDivMod(10, 3);
    let case2: Int = testDivMod(10, -3);
    let case3: Int = testDivMod(-10, 3);
    let case4: Int = testDivMod(-10, -3);
    
    // Sum of differences - all should be 0 if relationship holds
    return case1 + case2 + case3 + case4;
}

fun main() : Int {
    let precTest: Int = testPrecedence();  // expected 8
    let divModTest: Int = testDivModCases(); // expected 0
    return precTest + divModTest; // expected overall result: 8
}
