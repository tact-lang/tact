// This contract executes multiple tests of arithmetic and operator behavior as described in the documentation 
// We test operator precedence, division/modulo relationship, unary, bitwise, and ternary operators.
//
// Output values:
//   testPrecedence() returns 8, ensuring multiplication precedes subtraction
//   testDivModCases() returns 0, confirming a / b * b + a % b == a
//   testUnary() returns 45, validating unary operators: negation, non-null assertion, and logical inversion
//   testBitwiseShifts() returns 15, confirming right (>>) and left (<<) shift operations, including arithmetic right shift
//   testTernary() returns 50, verifying ternary operator behavior

fun testPrecedence(): Int {
    // Multiplication has higher precedence than subtraction
    let a: Int = 5 * 5 - 2;  // 25 - 2 = 23
    let b: Int = 5 * (5 - 2); // 5 * 3 = 15
    return a - b;           // 23 - 15 = 8
}

fun testDivMod(a: Int, b: Int) : Int {
    // Ensure that a == (a / b) * b + a % b, when b != 0
    return a - (((a / b) * b) + a % b);
}

fun testDivModCases(): Int {
    let case1: Int = testDivMod(10, 3);
    let case2: Int = testDivMod(10, -3);
    let case3: Int = testDivMod(-10, 3);
    let case4: Int = testDivMod(-10, -3);
    return case1 + case2 + case3 + case4; // All cases sum to 0 if the law holds
}

fun testUnary(): Int {
    // Testing unary negation and double application
    let a: Int = -(-1); // yields 1
    let b: Int = --1;   // yields 1

    // Testing non-null assertion (!!)
    let optionalValue: Int? = 42;
    let nonNull: Int = optionalValue!!; // yields 42

    // Testing inversion operator '!' on booleans
    let inverted: Bool = !true; // yields false
    
    // Using ternary operator to convert boolean to int: false yields 1
    return a + b + nonNull + (inverted ? 0 : 1); // 1 + 1 + 42 + 1 = 45
}

fun testBitwiseShifts(): Int {
    // Testing bitwise shifts
    let right: Int = 4 >> 1; // 4 >> 1 equals 2
    let left: Int = 2 << 3;  // 2 << 3 equals 16
    let negativeShift: Int = -6 >> 1; // arithmetic shift preserves sign; -6 >> 1 equals -3
    return right + left + negativeShift; // equals 2 + 16 - 3 = 15
}

fun testTernary() : Int {
    let a: Int = true ? 10 : 20;    // yields 10
    let b: Int = false ? 10 : 20;   // yields 20
    let c: Int = 10 > 20 ? (30 - 5) : (15 + 5); // condition false, yields 20
    return a + b + c; // 10 + 20 + 20 = 50
}

fun main() : Int {
    let precTest: Int = testPrecedence();      // expected 8
    let divModTest: Int = testDivModCases();       // expected 0
    let unaryTest: Int = testUnary();              // expected 45
    let shiftTest: Int = testBitwiseShifts();        // expected 15
    let ternaryTest: Int = testTernary();            // expected 50
    
    // Return sum of all tests, expected overall result: 8 + 0 + 45 + 15 + 50 = 118
    return precTest + divModTest + unaryTest + shiftTest + ternaryTest;
}
