fun testTernary(x: Int): Int {
    return x > 0 ? x : -x;
}

fun runTernaryTests(): Int {
    // Sum of absolute value results for a few parameters
    return testTernary(10) + testTernary(-10) + testTernary(0);
}
