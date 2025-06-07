fun testArithmeticShiftRight(): Int {
    // Testing arithmetic right shift on a negative number
    return (-8) >> 1; // Expected result is -4 (since arithmetic shift propagates sign bit)
}

fun main(): Int {
    return testArithmeticShiftRight();
}
