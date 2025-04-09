/*
Fuzz-Test: Operator Precedence and Ternary Operator
This snippet tests the correct evaluation order of various arithmetic operators and the ternary operator, ensuring subtle precedence and associativity rules are correctly applied.

Expected behaviors:
- Addition, multiplication, and subtraction should follow standard rules (e.g., 1 + 2 * 3 = 7 and 2 - 3 - 1 = (2 - 3) - 1 = -2).
- Parentheses should override precedence as expected.
- The ternary operator (?:) should select the correct branch.

This snippet combines these tests in a minimal, self-contained example.
*/

fun operatorPrecedenceTest() : Int {
    // Standard operator precedence:
    let a: Int = 1 + 2 * 3;       // 1 + (2*3) = 1 + 6 = 7
    let b: Int = 2 - 3 - 1;         // (2 - 3) - 1 = -1 - 1 = -2
    let c: Int = (4 + 5) * 2;       // (4+5)*2 = 9*2 = 18
    return a + b + c;             // 7 + (-2) + 18 = 23
}

fun ternaryTest(x: Int) : Int {
    // Ternary operator: if x is positive, return x; otherwise, return -x
    return x > 0 ? x : -x;
}

fun main() : Int {
    // Test operator precedence and ternary operator together:
    // operatorPrecedenceTest() is expected to be 23
    // ternaryTest(-10) is expected to be 10
    // Total expected output: 23 + 10 = 33
    return operatorPrecedenceTest() + ternaryTest(-10);
}
