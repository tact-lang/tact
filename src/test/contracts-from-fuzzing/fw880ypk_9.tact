/* Fuzz testing for assignment and augmented assignment operators in Tact.
   The testAssignmentOperatorError function which intentionally triggers a syntax error is excluded to allow the following code to compile successfully.
*/

fun testAugmentedAssignment(): Int {
    let value: Int = 5;
    value += 5; // Expected: value becomes 10
    return value;
}

fun testBoolAugAssign(): Bool {
    let flag: Bool = true;
    flag &&= false;  // Expected: flag becomes false
    return flag;
}

fun testArithmeticAugAssign(): Int {
    let a: Int = 10;
    a -= 3;  // a becomes 7
    a *= 2;  // a becomes 14
    a /= 7;  // a becomes 2
    a %= 3;  // a remains 2
    a += 5;  // a becomes 7
    return a;
}

fun main() {
    testAugmentedAssignment();
    testBoolAugAssign();
    testArithmeticAugAssign();
}
