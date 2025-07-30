/* Test 2: Early return based on condition */
fun testEarlyReturn(x: Int): Int {
    if (x > 10) {
        return x;
    }
    return -x;
}
