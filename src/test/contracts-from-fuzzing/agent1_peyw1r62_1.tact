fun testPrecedence() : Int {
    // According to the documentation, operator precedence gives multiplication higher precedence than subtraction.
    // Thus 5 * 5 - 2 should be interpreted as (5 * 5) - 2 = 25 - 2 = 23, while 5 * (5 - 2) is 5 * 3 = 15.
    let a: Int = 5 * 5 - 2;   // should be 23
    let b: Int = 5 * (5 - 2); // should be 15
    return a - b; // expected result: 8
}

// Also checking the division/modulo relation for both positive and negative numbers:
fun testDivMod(a: Int, b: Int) : Int {
    // According to documentation, a / b * b + a % b must equal a, for non-zero b.
    // This snippet returns the difference a - [a / b * b + a % b] to be verified as 0.
    return a - ((a / b) * b + a % b);
}

// Testing a few cases
fun main() : Int {
    let test1: Int = testPrecedence();
    let d1: Int = testDivMod(10, -3);  // 10 =? Should yield 0 if relation holds
    let d2: Int = testDivMod(-10, 3);  // -10, checking negative dividend
    let d3: Int = testDivMod(-10, -3); // both negative
    return test1 + d1 + d2 + d3; // expect 8 + 0 + 0 + 0 = 8
}
