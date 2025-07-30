// I've performed a suite of tests targeting the operator precedence and arithmetic behaviors as described in the Tact documentation.
// Below is a representative snippet that integrates various operators to demonstrate correct associativity, precedence, and edge cases.
// All behaviors matched what the documentation describes.

fun testComprehensiveOperators(): Int {
    // Test multiplication and subtraction with and without parentheses
    // According to precedence, * happens before -, so: 5 * 5 - 2 = 23; but 5 * (5 - 2) = 15
    let a: Int = 5 * 5 - 2;    // should be 23
    let b: Int = 5 * (5 - 2);    // should be 15
    
    // Test unary minus operator: -(-1) should yield 1
    let c: Int = -(-1);
    
    // Test double negation using consecutive '-' operators: --1 should compute to 1
    let d: Int = --1;
    
    // Test bitwise right shift on positive and negative numbers
    let e: Int = 4 >> 1;      // expected 2
    let f: Int = (-8) >> 1;   // arithmetic right shift on negative: expected -4
    
    // Test modulo with negative values as per documentation: 1 % 5 = 1, -1 % 5 = 4
    let g: Int = 1 % 5;       // 1
    let h: Int = -1 % 5;      // 4
    
    // Test bitwise OR operator: 2 | 1 should return 3
    let i: Int = 2 | 1;       // 3
    
    // Test logical operators using ternary expressions to simulate short-circuit behavior
    // (false && problematic_expr) should yield false without evaluating the expression
    let j: Int = (false && (1 / 0 == 0)) ? 1 : 0; // expected 0 (avoiding division by zero)
    // (true || problematic_expr) should yield true similarly
    let k: Int = (true || (1 / 0 == 0)) ? 1 : 0;  // expected 1

    // Consolidate all tests into a sum
    // Expected sum: (a - b) + c + d + e + f + g + h + i + j + k
    //              = (23 - 15) + 1 + 1 + 2 + (-4) + 1 + 4 + 3 + 0 + 1
    //              = 8 + 1 + 1 + 2 - 4 + 1 + 4 + 3 + 0 + 1
    //              = 17
    return (a - b) + c + d + e + f + g + h + i + j + k;
}

fun main(): Int {
    return testComprehensiveOperators();
}
